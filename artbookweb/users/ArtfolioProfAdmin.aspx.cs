using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace NaitbookWeb
{
    public partial class NaitBookUserUpdate : System.Web.UI.Page
    {
        public int UserId = 0;
        DataSet ProfileUser = null;
        public string Username = "";
        public string uxName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            UserId = int.Parse(Request.QueryString["UserId"]);
            ProfileUser = NaitBook.NaitBookController.LookupUser(UserId);
            Username = ProfileUser.Tables[0].Rows[0]["Username"].ToString();
            uxName = ProfileUser.Tables[0].Rows[0]["F_Name"].ToString()
                        + " " + ProfileUser.Tables[0].Rows[0]["L_Name"].ToString();

            sFUname.Text = ProfileUser.Tables[0].Rows[0]["F_Name"].ToString() 
                + " " + ProfileUser.Tables[0].Rows[0]["L_Name"].ToString();
            semail.Text = ProfileUser.Tables[0].Rows[0]["email"].ToString();
            ssex.Text = ProfileUser.Tables[0].Rows[0]["sex"].ToString();
            sMonth.Text = ProfileUser.Tables[0].Rows[0]["Month1"].ToString();
            sDay.Text = ProfileUser.Tables[0].Rows[0]["Day1"].ToString();
            sYear.Text = ProfileUser.Tables[0].Rows[0]["Year1"].ToString();
        }
        protected void update_Click(object sender, EventArgs e)
        {
            
            if (spassword.Text == spasswordCheck.Text)
            {
                int checkVal = NaitBook.NaitBookController.UpdateUser(UserId, System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(spassword.Text, "sha1"), semail.Text, ProfileUser.Tables[0].Rows[0]["imageloc"].ToString());
            }
            else { Label1.Text = "Your password did not match please try again"; }
        }

        protected void DeleteUser_Click(object sender, EventArgs e)
        {
            int checkVal = NaitBook.NaitBookController.DeleteUser(UserId);
        }
    }
}
