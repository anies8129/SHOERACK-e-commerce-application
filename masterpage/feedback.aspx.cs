using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace masterpage
{
    public partial class feedback1 : System.Web.UI.Page
    {
        connClass1 obj = new connClass1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string s = "insert into review values(" + Session["userid"] + ",'" + txtFeedback.Text + "','nil',1)";
            int i=obj.fun_nonquery(s);
            if(i==1)
            {
                Label1.Visible = true;
            }
            else
            {
                Label1.Visible = false;
            }
        }
    }
}