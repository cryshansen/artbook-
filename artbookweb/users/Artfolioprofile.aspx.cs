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
    public partial class Artfolioprofile : System.Web.UI.Page
    {
        DataSet UserStatus = null;
        DataSet AllUsers = null;
        DataSet AllPosts = null;
        DataSet ProfileUser = null;
        DataSet AllUsersStats = null;
        DataSet myfriends = null;
        public string Username = "";
        public int conUserId = 0;
        public int UserId = 0;
        public string postImgLoc = "";
        bool statflag = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            //uxModalPopupExtender.Show(); 
            UserId = int.Parse(Request.QueryString["UserId"]);
            ProfileUser = NaitBook.NaitBookController.LookupUser(UserId);
            conUserId = NaitBook.NaitBookController.LookupUserByName(User.Identity.Name);
            Username = ProfileUser.Tables[0].Rows[0]["Username"].ToString();
            
            uxProfileImage.ImageUrl = System.Configuration.ConfigurationManager.
               AppSettings["RelativeImagesDirectoryLocation"].ToString()
               + ProfileUser.Tables[0].Rows[0]["imageloc"].ToString();

            uxName.Text = ProfileUser.Tables[0].Rows[0]["F_Name"].ToString()
               + " " + ProfileUser.Tables[0].Rows[0]["L_Name"].ToString();
            if ((conUserId == UserId) && (statflag==false))
            {
                UserStatus=NaitBook.NaitBookController.GetLastStatusById(conUserId);
                if (UserStatus.Tables[0].Rows.Count > 0)
                {
                    NewStatus.Text = UserStatus.Tables[0].Rows[0]["myStatus"].ToString();
                }
            }
             if (!(Page.IsPostBack))
                    {
                        myfriends = NaitBook.NaitBookController.getFriendRequest(UserId);

                            if (myfriends.Tables["AllFriendRequests"].Rows.Count > 0)
                            {
                                FriendRequest.Text = "You have friend requests.";
                                //uxModalPopupExtender.Show(); 
                                AddFriendRepeater.DataSource = myfriends;
                               
                                //AddFriendRepeat.DataSource = myfriends;
                                AddFriendRepeater.DataMember = "AllFriendRequests";
                              AddFriendRepeater.DataBind();
                            }
                    }
            try
            {//check for no posts

                AllPosts = NaitBook.NaitBookController.GetPostsById(UserId);
                if (AllPosts.Tables[0].Rows.Count > 0)
                {
                    uxPostRepeater.DataSource = AllPosts;
                    uxPostRepeater.DataMember = "myPosts";
                    uxPostRepeater.DataBind();
                    postImgLoc = System.Configuration.ConfigurationManager.
                        AppSettings["RelativeImagesDirectoryLocation"].ToString()
                        + AllPosts.Tables[0].Rows[0]["ImageLoc"].ToString();
                }
                AllUsers = NaitBook.NaitBookController.GetMemberFriends(UserId);
                    //.LookupAllUsers();//this will soon be look up all friends
                    //.GetUserStatus(conUserId);//this will soon be look up all friends
                    //.LookupAllUsers();//this will soon be look up all friends
                if (AllUsers.Tables["Users"].Rows.Count > 0)
                {
                     System.Web.UI.WebControls.Image grdImage = new System.Web.UI.WebControls.Image();
                     //grdImage = e.Item.FindControl("imag");
                    // grdImage.ImageUrl = Strings.Trim(e.Item.Cells(1).Text);
                    //MembersFriends =AjaxClass.lesson2Construct.GetMemberFriends(Request.QueryString["UserLogonId"]);
                     uxFriendDatalist.DataSource = AllUsers.Tables["Users"];
                     uxFriendDatalist.DataMember = "Users";
                     uxFriendDatalist.DataBind();
                    //uxFriendGridView1.DataSource = AllUsers.Tables["Users"];
                    //uxFriendGridView1.DataMember = "Users";
                    //uxFriendGridView1.DataBind();
                    
                }
                AllUsersStats = NaitBook.NaitBookController.GetAllUserStatus();
                //if (AllUserStats.Tables["UserStatus"].Rows.Count > 0)
                //{
                    uxFriendStatusRepeater.DataSource = AllUsersStats.Tables["UserStatus"];
                    uxFriendStatusRepeater.DataMember = "UserStatus";
                    uxFriendStatusRepeater.DataBind();
                //}
                   
           }catch (Exception ex) { Label1.Text = "Posts ERROR: " + ex.Message.ToString(); }

        }

        protected void sub_PostButton_Click(object sender, EventArgs e)
        {
            conUserId = NaitBook.NaitBookController.LookupUserByName(User.Identity.Name);
            if (Post.Text.Length <= 0)
            {
                postlabel.Text = "You must enter some text";
            }
            else
            {
                NaitBook.NaitBookController.AddPost(UserId, Post.Text, conUserId);
                AllPosts = NaitBook.NaitBookController.GetPostsById(UserId);
                uxPostRepeater.DataSource = AllPosts;
                uxPostRepeater.DataMember = "myPosts";
                uxPostRepeater.DataBind();
            }
        }
        protected void StatusButton_Click(object sender, EventArgs e)
        {
            conUserId = NaitBook.NaitBookController.LookupUserByName(User.Identity.Name);

            if (StatusText.Text.Length <= 0)
            {
                StatusText.Text = "You must enter some text";
            }
            else
            {
                NaitBook.NaitBookController.AddStatus(conUserId, StatusText.Text);
                AllPosts = NaitBook.NaitBookController.GetPostsById(UserId);
                uxPostRepeater.DataSource = AllPosts;
                uxPostRepeater.DataMember = "myPosts";
                uxPostRepeater.DataBind();
                if (conUserId == UserId)
                {
                    UserStatus = NaitBook.NaitBookController.GetLastStatusById(conUserId);
                    NewStatus.Text = UserStatus.Tables[0].Rows[0]["myStatus"].ToString();
                    statflag = false;
                }
            }
        }

        protected void clearStatus_Click(object sender, EventArgs e)
        {
            NewStatus.Text = "";
            statflag = true;
        }

        protected void GetFriends_Click(object sender, EventArgs e)
        {
            //this launches the modal thing
            //get new info on friends...
            if (myfriends.Tables["AllFriendRequests"].Rows.Count > 0)
            {
                AddFriendRepeater.DataSource = myfriends;
                AddFriendRepeater.DataMember = "AllFriendRequests";
                AddFriendRepeater.DataBind();
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Button acceptBTN = sender as Button;
            string FriendId = acceptBTN.CommandArgument;
            FriendRequest.Text = FriendId;
            //AddFriend how do I capture the id???
            //int FriendId = 18;
            NaitBook.NaitBookController.AddFriend(int.Parse(FriendId),conUserId);
            Response.Redirect("Artfolioprofile.aspx?UserId=" + conUserId);

        }
        protected void Cancel_Click(object sender, EventArgs e)
        {   //reject must change friend status value to 'n'
            //Response.Redirect("AjaxxTestForm.aspx?UserId=" + UserId);
            //ModalPopupExtender1.Hide();
            Button rejectBTN = sender as Button;
            string FriendId = rejectBTN.CommandArgument;
            NaitBook.NaitBookController.RejectFriend(int.Parse(FriendId), conUserId);
            Response.Redirect("Artfolioprofile.aspx?UserId=" + conUserId);
        }
    }
}
