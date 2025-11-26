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
    public partial class payment : System.Web.UI.Page
    {
        connClass1 obj = new connClass1();
        protected void Page_Load(object sender, EventArgs e)
        {
            string cv = "select grand_total from bill where user_id=" + Session["userid"] + "";
            string f = obj.fun_scalar(cv);
            txtPayAmount.Text = f;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string kl = "insert into accounts values(" + Session["userid"] + ",'" + ddlAccType.SelectedItem.Text + "','" + txtAccNumber.Text + "','" + txtBalance.Text + "')";
            int i = obj.fun_nonquery(kl);
            if (i == 1)
            {
                pnlPayment.Visible = true;
                pnlAccount.Visible = false;
            }
            else
            {
                pnlAccount.Visible = true;
                pnlPayment.Visible = false;
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            bal2.ServiceClient obj3 = new bal2.ServiceClient();
            string o = obj3.balancheck(txtAccNumber.Text);
            int r = Convert.ToInt32(txtPayAmount.Text);
            int n = Convert.ToInt32(o);
            if (n < r)
            {
                lblPayStatus.Text = "insufficent balance";
            }
            else
            {
                string f = "select product_id from orders where user_id=" + Session["userid"] + "and order_status='order'";
                SqlDataReader dr = obj.fn_reader(f);
                List<string> pdlist = new List<string>();
                while (dr.Read())
                {
                    pdlist.Add((dr["product_id"].ToString()));
                }
                foreach (string productid in pdlist)
                {
                    string d = "select * from orders where product_id=" + productid + "and user_id=" + Session["userid"] + "";
                    SqlDataReader dv = obj.fn_reader(d);
                    string qty = "";
                    while (dv.Read())
                    {

                        qty = (dv["quantity"].ToString());
                    }
                    string vb = "update orders set order_status='payed' where user_id=" + Session["userid"] + "and product_id=" + productid + "";
                    int i = obj.fun_nonquery(vb);


                    string b = "select stock from product where product_id=" + productid + "";
                    string ni = obj.fun_scalar(b);
                    int oldStock = Convert.ToInt32(ni);

                    int orderedQty = Convert.ToInt32(qty);

                    int updatedStock = oldStock - orderedQty;

                    string up = "update product set stock=" + updatedStock + " where product_id=" + productid;
                    int aw = obj.fun_nonquery(up);

                }
                string df = "select balance_amount from accounts where user_id=" + Session["userid"] + "and account_number='" + txtAccNumber.Text + "'";
                string gh = obj.fun_scalar(df);
                int jk = Convert.ToInt32(gh);
                int kl = Convert.ToInt32(txtPayAmount.Text);
                int ds = jk - kl;



                int uid = Convert.ToInt32(Session["userid"]);
                int j = obj3.amountreduce(txtAccNumber.Text, uid, ds);
                lblPayStatus.Text = "payed";


            }
        }


        protected void txtAccNumber_TextChanged(object sender, EventArgs e)
        {
            string p = "select count(account_number) from accounts where user_id=" + Session["userid"] + "and account_number=" + txtAccNumber.Text + "";
            string f = obj.fun_scalar(p);
            int r = Convert.ToInt32(f);
            if (r == 1)
            {
                pnlPayment.Visible = true;
                pnlAccount.Visible = false;

            }
            else
            {
                pnlAccount.Visible = true;
                pnlPayment.Visible = false;
            }
        }

    }
}