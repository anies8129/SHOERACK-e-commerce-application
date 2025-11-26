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
    public partial class WebForm3 : System.Web.UI.Page
    {
        connClass1 obj = new connClass1();
        protected void Page_Load(object sender, EventArgs e)
        {
            string o = "select* from product where product_id=" + Session["productid"] + "";
            SqlDataReader dr = obj.fn_reader(o);
            if (dr.Read())
            {
                image1.ImageUrl = dr["product_photo"].ToString();
                label1.Text = dr["product_name"].ToString();
                label2.Text= dr["description"].ToString();
                label3.Text= dr["price"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int qty;
            string p = txtQuantity.Text;
            if (p == "")
            {
                qty = 0;
                txtQuantity.Text = Convert.ToString(qty);
            }

            else
            {

                int newqty = Convert.ToInt32(txtQuantity.Text);
                qty = newqty + 1;
                txtQuantity.Text = Convert.ToString(qty);

            }

            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            int qty;
            string p = txtQuantity.Text;
            if (p == "")
            {
                qty = 0;
                txtQuantity.Text = Convert.ToString(qty);
            }

            else
            {

                int newqty = Convert.ToInt32(txtQuantity.Text);
                qty = newqty - 1;
                txtQuantity.Text = Convert.ToString(qty);

            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            int r = Convert.ToInt32(txtQuantity.Text);
            string a = "select price from product where product_id=" + Session["productid"] + "";
            string p = obj.fun_scalar(a);
            int q = Convert.ToInt32(p);
            int subtotal = q * r;
            string g = "insert into cart values(" + Session["productid"] + "," + Session["userid"] + "," + txtQuantity.Text + ",1," + subtotal + ")";
            int ex = obj.fun_nonquery(g);
            if (ex == 1)
            {
                label1.Text = "true";
                label1.Text = "inserted";
            }
        }

        protected void btnContinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("cart.aspx");
        }
    }
}