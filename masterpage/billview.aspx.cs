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
    public partial class billview : System.Web.UI.Page
    {
        connClass1 obj = new connClass1();
        protected void Page_Load(object sender, EventArgs e)
        {
            string f = "SELECT dbo.customers.name, dbo.customers.email, dbo.customers.phone, dbo.customers.address, dbo.bill.grand_total FROM  dbo.customers INNER JOIN dbo.bill ON dbo.customers.user_id = dbo.bill.user_id where dbo.bill.user_id=" + Session["userid"] + "and dbo.bill.bill_id=" + Session["billid"] + "";
            SqlDataReader dr = obj.fn_reader(f);
            if (dr.Read())
            {
                lblCustomerName.Text = dr["name"].ToString();
                lblCustomerAddress.Text = dr["address"].ToString();
                lblCustomerphone.Text = dr["phone"].ToString();
                lblGrandTotal.Text = dr["grand_total"].ToString();
                lblCustomerEmail.Text = dr["email"].ToString();

            }
            string j = "SELECT dbo.orders.quantity, dbo.orders.subtotal, dbo.product.product_name, dbo.product.price FROM dbo.orders INNER JOIN dbo.product ON dbo.orders.product_id = dbo.product.product_id  where dbo.orders.user_id=" + Session["userid"] + "";
            DataSet ds = obj.fun_adapter(j);
            gridview1.DataSource = ds;
            gridview1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("payment.aspx");
        }
    }
}