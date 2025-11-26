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
    public partial class usermanage : System.Web.UI.Page
    {
        connClass1 obj = new connClass1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                grid_view();
            }
            
        }
        public void grid_view()
        {
            string f = "select user_id,name,email,phone,status from customers";
            DataSet ds = obj.fun_adapter(f);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);
            RadioButtonList rad = (RadioButtonList)GridView1.Rows[i].FindControl("radiobuttonList1");
            string s = rad.SelectedItem.Text;

            string f = "update customers set status='" + s + "' where user_id=" + getid + "";
            int c = obj.fun_nonquery(f);
            GridView1.EditIndex = -1;
            grid_view();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            grid_view();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            grid_view();
        }
    }
}