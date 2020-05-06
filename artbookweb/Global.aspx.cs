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

namespace ArtfolioBook
{
    public partial class Global : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //protected void Application_AuthenticateRequest(Object sender, EventArgs e)
        //{
        //    if (HttpContext.Current.User != null)
        //    {
        //        if (HttpContext.Current.User.Identity.AuthenticationType != "Forms")
        //        {
        //            throw new Exception("Only forms authentication is supported, not " +
        //              HttpContext.Current.User.Identity.AuthenticationType);
        //        }

        //        System.Security.Principal.IIdentity userId = HttpContext.Current.User.Identity;

        //        //Do we have some roles to retrieve?  If so, replace the user object
        //        if (Context.Cache.Get(userId.Name) != null)
        //        {
        //            HttpContext.Current.User = new System.Security.Principal.GenericPrincipal(
        //                               userId, (string[])Context.Cache.Get(userId.Name)
        //            );
        //        }

        //    }//user != null
        //}
    }
}
