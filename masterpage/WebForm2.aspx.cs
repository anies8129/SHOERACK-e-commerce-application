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
    public partial class WebForm2 : System.Web.UI.Page
    {
        connClass1 objd = new connClass1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click1(object sender, EventArgs e)
        {
            string u = "~/img/" + FileUpload1.FileName;
            FileUpload1.SaveAs(MapPath(u));
            string p = "insert into category values('" + TextBox1.Text + "','" + u + "','available','" + TextBox2.Text + "')";
            int i = objd.fun_nonquery(p);
            if (i == 1)
            {
                Label1.Visible = true;
                Label1.Text = "category added successfully";
            }
            else
            {
                Label1.Text = "unable to add category";
            }
        }
    }
}