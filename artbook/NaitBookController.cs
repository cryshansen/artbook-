using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace NaitBook
{
    public class NaitBookController
    {
        public static bool ValidateUser(string UserLogonId, string UserPassword)
        {
            return Users.ValidateUser(UserLogonId, UserPassword);
        }
        public static DataSet LookupUser(int UserId)
        {
            return Users.LookupUser(UserId);
        }
        public static DataSet LookupAllUsers()
        {
            return Users.LookupAllUsers(); 
        }
        public static DataSet GetMemberFriends(int UserId)
        {
            return Users.GetMemberFriends(UserId);
        }
        public static int SaveImage(string Profile_Image, int UserId)
        {
            return Users.SaveImage(Profile_Image, UserId);
        
        }
        public static int LookupUserByName(string Username)
        {
            return Users.LookupUserByName(Username);

        }
        public static DataSet GetPostsById(int UserId)
        {
            return Users.GetPostsById(UserId);
        }
        public static int AddUser(string Uname, string password, string Uf_Name, string Ul_Name, string Email, string Sex, string Birthday, string Image)
        {
            int UserId = Users.AddUser(Uname, password, Uf_Name, Ul_Name, Email, Sex, Birthday, Image);
            return UserId; 
        }
        public static int UpdateUser(int UserId,string password, string Email,string Image)
        {
            UserId = Users.UpdateUser(UserId,password,  Email, Image);            
            return UserId;
        }
        public static int DeleteUser(int UserId)
        {
            int userDelete;
                userDelete = Users.DeleteUser(UserId);
            return userDelete;
        }
        public static DataSet GetSex()
        {
            return Users.GetSex();
        }
        public static int AddPost(int UserId, string PostText, int postedby)
        {
            return Users.AddPost(UserId, PostText, postedby);
        }
        public static string[] GetUserRoles(string UserLogonId)
        {
            return Users.GetUserRoles(UserLogonId);
        }
        public static int AddStatus(int UserId, string StatusText)
        {
            return Users.AddStatus(UserId,StatusText);
        }
        public static DataSet GetStatusById(int UserId)
        { 
         return  Users.GetStatusById(UserId);
        }
        public static DataSet GetLastStatusById(int UserId)
        {
            return Users.GetStatusById(UserId);
        }
        public static DataSet GetUserStatus(int UserId)
        {
            return Users.GetUserStatus(UserId);
        }
        public static DataSet GetAllUserStatus()
        {
            return Users.GetAllUserStatus();
        }
        public static DataSet GetAllPostsAdmin()
        {
            return Users.GetAllPostsAdmin();
        }
        public static DataSet GetAllAlbumsById(int UserId) 
        {
            return Users.GetAllAlbumsById(UserId);
        }
        public static DataSet GetPhotosByAlbumId(int AlbumId)
        {
            return Users.GetPhotosByAlbumId(AlbumId);
        }
        public static int AddUserAlbums(int UserId, string AlbumName, string location, string albumDesc, string privacy)
        {
            int AlbumId = Users.AddUserAlbums(UserId, AlbumName, location, albumDesc, privacy);
            return AlbumId;
        }
        public static void AddPhotostoAlbum(int AlbumID)
        {
         Users.AddUserAlbumPhotos(AlbumID, "Question.jpg", "No Caption Available", 1);
        }
        public static int AddAlbumComment(int UserId, int AlbumId, int postedby, string CommentText)
        {
            return Users.AddAlbumComment(UserId, AlbumId, postedby, CommentText);
        }
        public static DataSet GetAlbumCommentsById(int UserId,int AlbumId)
        {
            return Users.GetAlbumCommentsById(UserId, AlbumId);
        }
        public static DataSet getFriendRequest(int UserId)
        {
            return Users.getFriendRequest(UserId);
        }
        public static void AddFriend(int FriendId,int UserId)
        {
           Users.AddFriend(FriendId,UserId);
        }
        public static void RejectFriend(int FriendId, int UserId)
        {
            Users.RejectFriend(FriendId, UserId);
        }

        

        
    }
}
