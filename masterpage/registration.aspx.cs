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
    public partial class registration : System.Web.UI.Page
    {
        connClass1 obj = new connClass1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string w = "select state_id,state_name from state";
                DataSet ds = obj.fun_adapter(w);
                DropDownList1.DataSource = ds;
                DropDownList1.DataTextField = "state_name";
                DropDownList1.DataValueField = "state_id";
                DropDownList1.DataBind();
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            string p = "select district_id,district_name from district where state_id=" + DropDownList1.SelectedValue + "";
            DataSet ds = obj.fun_adapter(p);
            DropDownList2.DataSource = ds;
            DropDownList2.DataTextField = "district_name";
            DropDownList2.DataValueField = "district_id";
            DropDownList2.DataBind();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string p = "select max(user_id) from customers";
            string maxid = obj.fun_scalar(p);
            int regid = 0;
            if (maxid == "")
            {
                regid = 1;
            }
            else
            {
                int newregid = Convert.ToInt32(maxid);
                regid = newregid + 1;

            }
            string h = "insert into customers values(" + regid + ",'" + TextBox1.Text + "','" + TextBox3.Text + "'," + TextBox4.Text + ",'" + TextBox5.Text + "'," + TextBox6.Text + ",'" + TextBox7.Text + "', " + DropDownList1.SelectedValue + "," + DropDownList2.SelectedValue + ",'active'," + TextBox2.Text + ")";
            int i = obj.fun_nonquery(h);
            if (i == 1)
            {
                string u = "insert into login values(" + regid + ",'" + TextBox8.Text + "','" + TextBox9.Text + "','user')";
                int j = obj.fun_nonquery(u);
                if (i == 1 && j == 1)
                {
                    Response.Redirect("index.aspx");
                }
            }
        }
    }
}