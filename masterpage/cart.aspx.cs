using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace masterpage
{
    public partial class cart : System.Web.UI.Page
    {
        connClass1 obj = new connClass1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grid_view();
                grand_total();

            }

        }
        public void grid_view()
        {
            string p = "SELECT dbo.product.product_name, dbo.product.product_photo,dbo.product.price,dbo.cart.cart_id, dbo.cart.quantity, dbo.cart.subtotal FROM dbo.product  JOIN dbo.cart ON dbo.product.product_id = dbo.cart.product_id where user_id=" + Session["userid"] + "and dbo.cart.cart_status=1";
            DataSet ds = obj.fun_adapter(p);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        public void grand_total()
        {
            string p = "select sum(subtotal) from cart where user_id=" + Session["userid"] + "and cart_status=1";
            string f = obj.fun_scalar(p);
            if (f == "")
            {
                Label1.Visible = false;
                Label2.Visible = false;
                Label3.Visible = true;
                Label3.Text = "no products in cart";
            }
            else
            {
                Label1.Visible = true;
                Label2.Visible = true;
                Label3.Visible = true;
                Label3.Text = f;
            }
        }

            protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            grid_view();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);
            string f = "delete from cart where cart_id=" + getid + "";
            int w = obj.fun_nonquery(f);
            grid_view();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            grid_view();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);
            string f = "SELECT dbo.product.price FROM dbo.cart INNER JOIN dbo.product ON dbo.cart.product_id = dbo.product.product_id";
            string a = obj.fun_scalar(f);
            int k = Convert.ToInt32(a);
            TextBox textqty = (TextBox)GridView1.Rows[i].Cells[5].Controls[0];



            string d = "update cart set quantity=" + textqty.Text + " where cart_id=" + getid + "";


            int v = obj.fun_nonquery(d);

            string c = "select quantity from cart where cart_id=" + getid + "";
            string jj = obj.fun_scalar(c);
            int getsub = Convert.ToInt32(jj);
            string fg = "update cart set subtotal=" + getsub * k + "where cart_id=" + getid + "";
            int l = obj.fun_nonquery(fg);
            GridView1.EditIndex = -1;
            grid_view();
            grand_total();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string f = "select product_id from cart where user_id=" + Session["userid"] + "and cart_status=1";
            SqlDataReader dr = obj.fn_reader(f);
            List<string> pdlist = new List<string>();
            while (dr.Read())
            {
                pdlist.Add((dr["product_id"].ToString()));
            }
            foreach (string productid in pdlist)
            {
                string d = "select * from cart where product_id=" + productid + "and user_id=" + Session["userid"] + "";
                SqlDataReader dv = obj.fn_reader(d);
                string subtotal = "", qty = "";
                while (dv.Read())
                {
                    subtotal = (dv["subtotal"].ToString());
                    qty = (dv["quantity"].ToString());
                }
                string w = "insert into orders values(" + Session["userid"] + "," + productid + ",'" + DateTime.Now.ToString("yyyy-MM-dd") + "','order'," + qty + "," + subtotal + ")";
                int i = obj.fun_nonquery(w);


                string k = "update cart set cart_status=0 where product_id=" + productid + "";
                int g = obj.fun_nonquery(k);
                string b = "select stock from product where product_id=" + productid + "";
                string ni = obj.fun_scalar(b);
                int currentStock = Convert.ToInt32(ni);

                int orderedQty = Convert.ToInt32(qty);

                int updatedStock = currentStock - orderedQty;

                string up = "update product set stock=" + updatedStock + " where product_id=" + productid;
                int kl = obj.fun_nonquery(up);






            }
            string a = "select sum(subtotal) from orders where user_id=" + Session["userid"] + "and order_status='order'";
            string l = obj.fun_scalar(a);

            string q = "insert into bill values(" + Session["userid"] + ",'" + DateTime.Now.ToString("yyyy-MM-dd").ToString() + "'," + l + ")";
            int t = obj.fun_nonquery(q);
            string z = "select max(bill_id) from bill where user_id=" + Session["userid"] + "";
            string h = obj.fun_scalar(z);
            int aq = Convert.ToInt32(h);
            Session["billid"] = aq;
            if (t == 1)
            {
                Response.Redirect("billview.aspx");
                Label4.Text = "success";
            }
        }
    }
}