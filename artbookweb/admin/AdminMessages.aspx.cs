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

namespace ArtfolioBook.admin
{
    public partial class AdminMessages : System.Web.UI.Page
    {
        DataSet AllUsers = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            AllUsers = NaitBook.NaitBookController.GetAllPostsAdmin();
            uxUsersRepeater.DataSource = AllUsers;
            uxUsersRepeater.DataMember = "Users";
            uxUsersRepeater.DataBind();
        }
    }
}
