using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Net.Mail;

namespace masterpage
{
    public partial class reply : System.Web.UI.Page
    {
        connClass1 obj = new connClass1();
        protected void Page_Load(object sender, EventArgs e)
        {
            string s = "select email from admin where admin_id=" + Session["userid"] + "";
            SqlDataReader dr = obj.fn_reader(s);
            while (dr.Read())
            {
                txtFrom.Text = dr["email"].ToString();
            }
            string z = "SELECT dbo.customers.email FROM dbo.customers INNER JOIN dbo.review ON dbo.customers.user_id = dbo.review.user_id where dbo.review.review_id=" + Session["feedid"] + "";
            SqlDataReader dr1 = obj.fn_reader(z);
            while (dr1.Read())
            {
                txtTo.Text = dr1["email"].ToString();
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string s = "select name from admin where admin_id=" + Session["userid"] + "";
            string cv = obj.fun_scalar(s);
            string z = "SELECT dbo.customers.name FROM dbo.customers INNER JOIN dbo.review ON dbo.customers.user_id = dbo.review.user_id where dbo.review.review_id=" + Session["feedid"] + "";
            string gh = obj.fun_scalar(z);

            SendEmail2(cv, txtFrom.Text, "zpqb qpek sphi zsch", gh, txtTo.Text, txtSubject.Text, txtBody.Text);
        }
        public static void SendEmail2(string yourname, string yourGmailUserName, string yourGmailPassword, string tonaame, string toEmail, string subject, string body)

        {
            string to = toEmail; //To address    
            string from = yourGmailUserName; //From address    
            MailMessage message = new MailMessage(from, to);

            string mailbody = body;
            message.Subject = subject;
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            System.Net.NetworkCredential basicCredential1 = new
            System.Net.NetworkCredential(yourGmailUserName, yourGmailPassword);
            client.EnableSsl = true;
            client.UseDefaultCredentials = true;
            client.Credentials = basicCredential1;
            try
            {
                client.Send(message);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
    