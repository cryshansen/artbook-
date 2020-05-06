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


namespace NaitbookWeb
{
    public partial class imageupload : System.Web.UI.Page
    {   public int UserId = 0;
        public int AlbumId = 0;
        public int conUserId = 0;
        public string UserName = "";
        bool statflag = false;
        DataSet UserStatus = null;
        DataSet AllUsersStats = null;
        DataSet AllComments = null;
        protected void Page_Load(object sender, EventArgs e)
        {   

            UserId = int.Parse(Request.QueryString["UserId"]);
            
            if (!(Page.IsPostBack))
            {
                if ((Request.QueryString["AlbumId"]) != null)
                {
                    AlbumId = int.Parse(Request.QueryString["AlbumId"]);
                    // get the album info and the images no?
                    
                    DataSet UserAlbums = NaitBook.NaitBookController.GetPhotosByAlbumId(AlbumId);
                    uxTitle.Text="View Album "+UserAlbums.Tables[0].Rows[0]["AlbumName"];
                    if (UserAlbums.Tables[0].Rows.Count > 0)
                    {
                        uxAlbumList.DataSource = UserAlbums;
                        uxAlbumList.DataMember = "AllAlbums";
                        uxAlbumList.DataBind();
                    }

                }
                else
                {
                    DataSet UserAlbums = NaitBook.NaitBookController.GetAllAlbumsById(UserId);
                    uxTitle.Text="Manage Your Albums ";
                    if (UserAlbums.Tables[0].Rows.Count > 0)
                    {
                        uxAlbumList.DataSource = UserAlbums;
                        uxAlbumList.DataMember = "AllAlbums";
                        uxAlbumList.DataBind();
                    }
                }
                AllUsersStats = NaitBook.NaitBookController.GetAllUserStatus();
                //if (AllUserStats.Tables["UserStatus"].Rows.Count > 0)
                //{
                uxFriendStatusRepeater.DataSource = AllUsersStats.Tables["UserStatus"];
                uxFriendStatusRepeater.DataMember = "UserStatus";
                uxFriendStatusRepeater.DataBind();
                //}
                AllComments = NaitBook.NaitBookController.GetAlbumCommentsById(UserId, AlbumId);
                uxImageCommentsRepeater.DataSource = AllComments;
                uxImageCommentsRepeater.DataMember = "myComments";
                uxImageCommentsRepeater.DataBind();
            }
            DataSet myUser = NaitBook.NaitBookController.LookupUser(UserId);
            UserName = myUser.Tables[0].Rows[0]["F_Name"].ToString() + " " + myUser.Tables[0].Rows[0]["L_Name"].ToString();
            uxName.Text=UserName;

            uxProfileImage.ImageUrl = System.Configuration.ConfigurationManager.
               AppSettings["RelativeImagesDirectoryLocation"].ToString()
               + myUser.Tables[0].Rows[0]["imageloc"].ToString();
            conUserId = NaitBook.NaitBookController.LookupUserByName(User.Identity.Name);
            if ((conUserId == UserId) && (statflag==false))
            {
                UserStatus=NaitBook.NaitBookController.GetLastStatusById(conUserId);
                NewStatus.Text = UserStatus.Tables[0].Rows[0]["myStatus"].ToString();
            }
            
                
            
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (Profile_Image.HasFile)
            {
                try
                {
                    Directory.CreateDirectory(
                        System.Configuration.ConfigurationManager.AppSettings["ImagesDirectoryLocation"].ToString()
                        + User.Identity.Name);

                    Profile_Image.SaveAs(
                        System.Configuration.ConfigurationManager.AppSettings["ImagesDirectoryLocation"].ToString()
                        + User.Identity.Name + "\\"
                        + Profile_Image.FileName);
                    uxFileInfo.Text = "File name: " +
                         Profile_Image.PostedFile.FileName + "<br>" +
                         Profile_Image.PostedFile.ContentLength + " kb<br>" +
                         "Content type: " +
                         Profile_Image.PostedFile.ContentType;
                }
                catch (Exception ex)
                {
                    uxFileInfo.Text = "ERROR: " + ex.Message.ToString();
                }
            }
            else
            {
                uxFileInfo.Text = "You have not specified a file.";
            }

        }

        protected void CreateAlbum_Click(object sender, EventArgs e)
        {
            //this opens the modalPopupExtender
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //add album to db
            string Privacy = "";
            if (int.Parse(PrivacyList.SelectedValue) == 1){
                Privacy = "No One";
            }
            else if (int.Parse(PrivacyList.SelectedValue) == 2)
            {
                Privacy = "Everyone";
             }
             else if (int.Parse(PrivacyList.SelectedValue) == 3)
             {
                 Privacy = "Only Friends";
             }
             else 
            { 
                 Privacy = "No One"; 
             
             }
             try
             {
                AlbumId= NaitBook.NaitBookController.AddUserAlbums(UserId, AlbumName.Text, AlbumLocation.Text, ADescription.Text, Privacy);
                NaitBook.NaitBookController.AddPhotostoAlbum(AlbumId);
            }
            catch (Exception ex)
            {
                uxFileInfo.Text = "Album ERROR: " + ex.Message.ToString();

            }
             
               Response.Redirect("imageUpload.aspx?UserId=" + UserId);
                ModalPopupExtender1.Hide(); 
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("imageUpload.aspx?UserId="+ UserId);
            ModalPopupExtender1.Hide();
        }

        protected void CommentButton_Click(object sender, EventArgs e)
        {
            conUserId = NaitBook.NaitBookController.LookupUserByName(User.Identity.Name);

            if (ImageComment.Text.Length <= 0)
            {
                ImageComment.Text = "You must enter some text";
            }
            else
            {
                NaitBook.NaitBookController.AddAlbumComment(conUserId, AlbumId, UserId, ImageComment.Text);
                AllComments = NaitBook.NaitBookController.GetAlbumCommentsById(UserId,AlbumId);
                uxImageCommentsRepeater.DataSource=AllComments;
                uxImageCommentsRepeater.DataMember = "myComments";
                uxImageCommentsRepeater.DataBind();
                if (conUserId == UserId)
                {
                    UserStatus = NaitBook.NaitBookController.GetLastStatusById(conUserId);
                    NewStatus.Text = UserStatus.Tables[0].Rows[0]["myStatus"].ToString();
                    statflag = false;
                }
            }
        }

        protected void DeleteImage_Click(object sender, EventArgs e)
        {
            //this goes to db and deletes image
        }

        protected void AddImages_Click(object sender, EventArgs e)
        {
            //this uses the ModalPopupExtender2 for adding images

        }

        protected void SaveImage_Click(object sender, EventArgs e)
        {
            //actually saves the file

        }

        protected void CancelImage_Click(object sender, EventArgs e)
        {
            Response.Redirect("imageUpload.aspx?UserId=" + UserId);
            ModalPopupExtender2.Hide();
        }

        protected void uploadProfileImage_Click(object sender, EventArgs e)
        {
            //goes to popupextender3
        }
    }
}
