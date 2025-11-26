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
    public partial class addproduct : System.Web.UI.Page
    {
        connClass1 obj = new connClass1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string g = "select category_id,category_name from category";
                DataSet ds = obj.fun_adapter(g);
                DropDownList1.DataSource = ds;
                DropDownList1.DataTextField = "category_name";
                DropDownList1.DataValueField = "category_id";
                DropDownList1.DataBind();
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string u = "~/assets/" + FileUpload1.FileName;
            FileUpload1.SaveAs(MapPath(u));
            string p = "insert into product values(" + DropDownList1.SelectedItem.Value + ",'" + TextBox1.Text + "','" + u + "','" + TextBox2.Text + "'," + TextBox3.Text + "," + TextBox4.Text + ",'available')";
            int i = obj.fun_nonquery(p);
            if (i == 1)
            {
                Label1.Visible = true;
                Label1.Text = "product added successfully";
            }
            else
            {
                Label1.Text = "unable to add product";
            }
        }

    }
}