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
    public partial class login1 : System.Web.UI.Page
    {
        connClass1 objd = new connClass1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string p = "select count(reg_id) from login where username='" + TextBox1.Text + "'and password='" + TextBox2.Text + "'";
            string f = objd.fun_scalar(p);
            int i = Convert.ToInt32(f);
            if (i == 1)
            {
                string u = "select reg_id from login where username='" + TextBox1.Text + "'and password='" + TextBox2.Text + "'";
                string g = objd.fun_scalar(u);
                Session["userid"] = g;
                string j = "select log_type from login where username='" + TextBox1.Text + "'and password='" + TextBox2.Text + "'";
                string d = objd.fun_scalar(j);
                if (d == "admin")
                {
                    Response.Redirect("adminhome.aspx");
                }
                else if (d == "user")
                {
                    Response.Redirect("userhome.aspx");
                }

            }
        }
    }
}