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
using System.IO;
using System.Web.Caching;

namespace ArtfolioBook
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //protected void Logon_Click(object sender, EventArgs e)
        //{
        //    Message.Text = "";

        //    UserLogonId.Text = UserLogonId.Text.Trim();
        //    UserPassword.Text = UserPassword.Text.Trim();

        //    if (UserLogonId.Text.Length > 0 && UserPassword.Text.Length > 0)
        //    {
        //        if (IsValidUser(UserLogonId.Text, UserPassword.Text))
        //        {
        //            String[] roles = NaitBook.NaitBookController.GetUserRoles(UserLogonId.Text);

        //            Cache.Add(UserLogonId.Text, roles, null, DateTime.MaxValue,
        //                        TimeSpan.FromHours(1), CacheItemPriority.BelowNormal, null);
        //            System.Web.Security.FormsAuthentication.RedirectFromLoginPage(UserLogonId.Text, RememberMe.Checked);
        //        }
        //        else
        //        {
        //            Message.Text = "Invalid Userid and/or Password.";
        //        }
        //    }
        //    else
        //        Message.Text = "You must supply a Userid and Password.";
        //}

        //private bool IsValidUser(string UserLogonId, string UserPassword)
        //{
        //    return NaitBook.NaitBookController.ValidateUser(UserLogonId, UserPassword);

        //}

        //FIRST LAB CODE
        protected void Logon_Click(object sender, EventArgs e)
        {
            Message.Text = "";

            UserLogonId.Text = UserLogonId.Text.Trim();
            UserPassword.Text = UserPassword.Text.Trim();

            if (UserLogonId.Text.Length > 0 && UserPassword.Text.Length > 0)
            {
                if (IsValidUser(UserLogonId.Text, System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(UserPassword.Text, "sha1")))
                {
                    System.Web.Security.FormsAuthentication.RedirectFromLoginPage(UserLogonId.Text, RememberMe.Checked);
                }
                else
                {
                    Message.Text = "Invalid Userid and/or Password.  Whats Going on here??";
                }
            }
            else
                Message.Text = "You must supply a Userid and Password.";
        }

        private bool IsValidUser(string UserLogonId, string UserPassword)
        {
            return NaitBook.NaitBookController.ValidateUser(UserLogonId, UserPassword);
        }
    }
}
