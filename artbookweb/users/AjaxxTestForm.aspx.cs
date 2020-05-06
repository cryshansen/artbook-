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

namespace ArtfolioBook.users
{
    public partial class AjaxxTestForm : System.Web.UI.Page
    {
        DataSet myfriends = null;
        public int conUserId = 0;
        public int UserId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {           
            UserId = NaitBook.NaitBookController.LookupUserByName(User.Identity.Name);
            myfriends = NaitBook.NaitBookController.getFriendRequest(UserId);
            if (myfriends.Tables["AllFriendRequests"].Rows.Count > 0)
            {
                FriendRequest.Text = "You have friend requests.";
                //uxModalPopupExtender.Show(); 
                AddFriendRepeater.DataSource = myfriends;
                AddFriendRepeater.DataMember = "AllFriendRequests";
                AddFriendRepeater.DataBind();
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            //AddFriend
           // NaitBook.NaitBookController.AddFriend(FriendId,UserId);
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AjaxxTestForm.aspx?UserId=" + UserId);
            ModalPopupExtender1.Hide();
        }
    }
}
