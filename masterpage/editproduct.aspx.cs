using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;

namespace masterpage
{
    public partial class editproduct : System.Web.UI.Page
    {
        connClass1 obj = new connClass1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grid_view();
            }
        }
        public void grid_view()
        {
            string p = "select * from product";
            DataSet ds = obj.fun_adapter(p);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        { 
                int i = e.RowIndex;
                int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);
                TextBox textstatus = (TextBox)GridView1.Rows[i].Cells[3].Controls[0];
                TextBox textdesc = (TextBox)GridView1.Rows[i].Cells[4].Controls[0];
                TextBox textprice = (TextBox)GridView1.Rows[i].Cells[5].Controls[0];

                FileUpload fileUpload = (FileUpload)GridView1.Rows[i].FindControl("FileUpload1");
                HiddenField HiddenField2 = (HiddenField)GridView1.Rows[i].FindControl("HiddenField2");

                string imgPath = HiddenField2.Value; // Set old image as default

                if (fileUpload != null && fileUpload.HasFile)
                {


                    string fileName = Path.GetFileName(fileUpload.FileName);
                    string uploadPath = Server.MapPath("~/assets/") + fileName;
                    fileUpload.SaveAs(uploadPath);
                    imgPath = "~/assets/" + fileName;

                }


                string h = "update product set product_status='" + textstatus.Text + "',description='" + textdesc.Text + "',product_photo='" + imgPath + "',price='" + textprice.Text + "' where product_id=" + getid + "";
                int c = obj.fun_nonquery(h);
                if (c == 1)
                {
                    Label1.Visible = true;
                    Label1.Text = "updated";

                    GridView1.EditIndex = -1;
                    grid_view();
                }
                else
                {
                    Label1.Text = "unable to update";
                }
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



   