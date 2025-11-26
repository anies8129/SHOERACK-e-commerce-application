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
    public partial class viewfeedback : System.Web.UI.Page
    {
        connClass1 obj = new connClass1();
        protected void Page_Load(object sender, EventArgs e)
        {
            string f = "SELECT dbo.customers.user_id,dbo.customers.name, dbo.review.review_id, dbo.review.review FROM dbo.customers INNER JOIN dbo.review ON dbo.customers.user_id = dbo.review.user_id where dbo.review.feedback_status=1";
            DataSet ds = obj.fun_adapter(f);
            gridview1.DataSource = ds;
            gridview1.DataBind();
        }

        protected void LinkButton1_Command1(object sender, CommandEventArgs e)
        {
            int getid = Convert.ToInt32(e.CommandArgument);
            Session["feedid"] = getid;
            Response.Redirect("reply.aspx");
        }
    }
}