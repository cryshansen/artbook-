using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace NaitBook
{
    class Users
    {
        //from Conrads Code
         internal static DataSet LookupUser(int UserId)
        {
            DataSet ProfileUser = null;
            using (SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString))
            {
                SqlDataAdapter LookupUserAdapter =
                    new SqlDataAdapter("Exec LookupUser @UserId", NaitBookConnection);
                LookupUserAdapter.SelectCommand.Parameters.Add
                    ("@UserId", SqlDbType.Int).Value = UserId;
                ProfileUser = new DataSet();
                LookupUserAdapter.Fill(ProfileUser, "Users");
            }
            return ProfileUser;
        }
        internal static int LookupUserByName(string Username)
		 {
             int ProfileUserId = 0;
             using (SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString))
             {
                 SqlCommand LookupUser =
                     new SqlCommand("Exec LookupUserByName @Username", NaitBookConnection);
                 LookupUser.Parameters.Add("@Username", SqlDbType.VarChar).Value = Username;
                 NaitBookConnection.Open();
                 ProfileUserId = int.Parse(LookupUser.ExecuteScalar().ToString());
             }
            return ProfileUserId;
        }
        //Check for valid User
        internal static bool ValidateUser(string Uname, string password)
        {
            bool UserIsValid = false;

            using (SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString))
            {
                SqlCommand ValidateLogonCredentials =
                    new SqlCommand("Exec ValidateLogonCredentials @Uname, @UserPassword", 
                    NaitBookConnection);
                ValidateLogonCredentials.Parameters.Add("@Uname", SqlDbType.VarChar).Value 
                    = Uname;
                ValidateLogonCredentials.Parameters.Add("@UserPassword", SqlDbType.VarChar).Value
                    = password;

                NaitBookConnection.Open();

                UserIsValid = int.Parse(ValidateLogonCredentials.ExecuteScalar().ToString()) == 0;
            }

            return UserIsValid;
        }
        internal static string[] GetUserRoles(string UserLogonId)
        {
            string[] RolesArray = null;
            using (SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString))
            {
                SqlDataAdapter GetUserrolesAdapter = new
                        SqlDataAdapter("Exec GetUserroles @UserLogonId", NaitBookConnection);
                GetUserrolesAdapter.SelectCommand.Parameters.Add
                        ("@UserLogonId", SqlDbType.VarChar).Value = UserLogonId;

                DataSet UserRoles = new DataSet();

                GetUserrolesAdapter.Fill(UserRoles, "Roles");

                //allocate memory for the array of strings
                RolesArray = new string[UserRoles.Tables["Roles"].Rows.Count];
                for (int c = 0; c < RolesArray.Length; c++)
                {
                    RolesArray[c] = UserRoles.Tables["Roles"].Rows[c]["RoleName"].ToString();
                }
            }
            return RolesArray;
        }
    
     //   //Read All Users
        internal static DataSet LookupAllUsers()
        {
            DataSet AllUsers = null;
            SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString);
            SqlDataAdapter GetAllUsersAdapter = new SqlDataAdapter("Exec LookupAllUsers", NaitBookConnection);
            AllUsers = new DataSet();
            GetAllUsersAdapter.Fill(AllUsers, "Users");
            return AllUsers;
        }

        internal static DataSet GetMemberFriends(int UserId)
        {
            DataSet AllUsers = null;
            SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString);
            SqlDataAdapter GetAllUsersAdapter = new SqlDataAdapter("Exec GetMemberFriends @UserId", NaitBookConnection);
            GetAllUsersAdapter.SelectCommand.Parameters.Add
                        ("@UserId", SqlDbType.VarChar).Value = UserId;
            AllUsers = new DataSet();
            GetAllUsersAdapter.Fill(AllUsers, "Users");
            return AllUsers;
        }
        internal static DataSet GetPostsById(int UserId)
        {
            DataSet AllPosts = null;
            using (SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString))
            {
                SqlDataAdapter LookupUserAdapter =
                    new SqlDataAdapter("Exec GetPostsById @UserId", NaitBookConnection);
                LookupUserAdapter.SelectCommand.Parameters.Add
                    ("@UserId", SqlDbType.Int).Value = UserId;
                AllPosts = new DataSet();
                LookupUserAdapter.Fill(AllPosts, "myPosts");
            }
            return AllPosts;
        }
        internal static DataSet GetStatusById(int UserId)
        {
            DataSet AllPosts = null;
            using (SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString))
            {
                SqlDataAdapter LookupUserAdapter =
                    new SqlDataAdapter("Exec GetStatusById @UserId", NaitBookConnection);
                LookupUserAdapter.SelectCommand.Parameters.Add
                    ("@UserId", SqlDbType.Int).Value = UserId;
                AllPosts = new DataSet();
                LookupUserAdapter.Fill(AllPosts, "myPosts");
            }
            return AllPosts;
        }
        internal static DataSet GetLastStatusById(int UserId)
        {
            DataSet AllPosts = null;
            using (SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString))
            {
                SqlDataAdapter LookupUserAdapter =
                    new SqlDataAdapter("Exec GetStatusById @UserId", NaitBookConnection);
                LookupUserAdapter.SelectCommand.Parameters.Add
                    ("@UserId", SqlDbType.Int).Value = UserId;
                AllPosts = new DataSet();
                LookupUserAdapter.Fill(AllPosts, "myPosts");
                
            }
            return AllPosts;
        }
        internal static DataSet GetUserStatus(int UserId)
        {
            DataSet UsersStatus = null;
            using (SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString))
            {
                SqlDataAdapter LookupUserAdapter =
                    new SqlDataAdapter("Exec GetStatusById @UserId", NaitBookConnection);
                LookupUserAdapter.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
                UsersStatus = new DataSet();
                LookupUserAdapter.Fill(UsersStatus, "UserStatus");
            }
            return UsersStatus;
        }
        internal static DataSet GetAllUserStatus()
        {
            DataSet UsersStatus = null;
            using (SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString))
            {
                SqlDataAdapter LookupUserAdapter =
                    new SqlDataAdapter("Exec GetUserStatus", NaitBookConnection);
               
                UsersStatus = new DataSet();
                LookupUserAdapter.Fill(UsersStatus, "UserStatus");
                //AllStatusAndUsers.Relations.Add("User_Status", AllStatusAndUsers.Tables["Users"].Columns["UserId"], AllStatusAndUsers.Tables["Status"].Columns["UserId"]);
            }
            return UsersStatus;
        }
        //Add
        internal static int SaveImage(string Profile_Image,int UserId)
        {
            SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString);
            SqlCommand AddUserImage = new SqlCommand("SaveImage", NaitBookConnection);
            AddUserImage.CommandType = CommandType.StoredProcedure;
            AddUserImage.Parameters.Add("@imageloc",SqlDbType.VarChar).Value = Profile_Image;
            AddUserImage.Parameters.Add("@UserId", SqlDbType.VarChar).Value = UserId;
            NaitBookConnection.Open();
            int flag = AddUserImage.ExecuteNonQuery();
            return flag;
        
        }
        internal static int AddUser(string Uname, string password, string Uf_Name, string Ul_Name, string Email,string Sex,string Birthday,  string Image)
        {
            SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString);
            SqlCommand AddUser = new SqlCommand("AddUser", NaitBookConnection);
            AddUser.CommandType = CommandType.StoredProcedure;
            AddUser.Parameters.Add("@Uname", SqlDbType.VarChar).Value = Uname;
            AddUser.Parameters.Add("@password", SqlDbType.VarChar).Value = password;
            AddUser.Parameters.Add("@Uf_Name", SqlDbType.VarChar).Value = Uf_Name;
            AddUser.Parameters.Add("@Ul_Name", SqlDbType.VarChar).Value = Ul_Name;
            AddUser.Parameters.Add("@Email", SqlDbType.VarChar).Value = Email;
            AddUser.Parameters.Add("@Sex", SqlDbType.VarChar).Value = Sex;
            AddUser.Parameters.Add("@Birthday", SqlDbType.VarChar).Value = Birthday;
            AddUser.Parameters.Add("@Image", SqlDbType.VarChar).Value = Image;
            NaitBookConnection.Open();
            //This should be execute scalar() as per Conrad. You know what crystal. Just do it the way you want to and get help for the specific errors
            //This was working at one time and now its not.
            int UserId = int.Parse(AddUser.ExecuteScalar().ToString());
            return UserId;

        }
       
        ////Update
        internal static int UpdateUser(int UserId, string password,  string Email, string Image)
        {
            SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString);
            SqlCommand AddUser = new SqlCommand("UpdateUser", NaitBookConnection);
            AddUser.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
            AddUser.Parameters.Add("@password", SqlDbType.VarChar).Value = password;
            AddUser.Parameters.Add("@Email", SqlDbType.VarChar).Value = Email;
            AddUser.Parameters.Add("@Image", SqlDbType.VarChar).Value = Image;
            NaitBookConnection.Open();
            int UserLogonId = AddUser.ExecuteNonQuery();
            return UserLogonId;
            //must make sure to reinsert password into useraccounts so that actually changes where counts
        
        }
        internal static DataSet GetSex()
        {
            DataSet AllSex = null;
            SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString);
            SqlDataAdapter GetAllUsersAdapter = new SqlDataAdapter("Exec GetSex", NaitBookConnection);
            AllSex = new DataSet();
            GetAllUsersAdapter.Fill(AllSex, "Sex");
            return AllSex;
        }
 
    

     ////Delete

        internal static int DeleteUser(int UserId)
        {
            SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString);
            SqlCommand AddUser = new SqlCommand("DeleteUser", NaitBookConnection);
            AddUser.CommandType = CommandType.StoredProcedure;
            AddUser.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
            NaitBookConnection.Open();
            int UserIdDel = AddUser.ExecuteNonQuery();
            return UserIdDel;
        }

        internal static int AddPost(int UserId, string PostText, int postedby)
        { //AddPost(@UserId int ,@PostText text,@postedby int)
            SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString);
            SqlCommand AddUser = new SqlCommand("AddPost", NaitBookConnection);
            AddUser.CommandType = CommandType.StoredProcedure;
            AddUser.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
            AddUser.Parameters.Add("@postedby", SqlDbType.Int).Value = postedby;
            AddUser.Parameters.Add("@PostText", SqlDbType.Text).Value = PostText;
            NaitBookConnection.Open();
            int PostId = AddUser.ExecuteNonQuery();
            return PostId;

        }
        internal static int AddStatus(int UserId, string StatusText)
        { //AddPost(@UserId int ,@PostText text,@postedby int)
            SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString);
            SqlCommand AddUser = new SqlCommand("AddStatus", NaitBookConnection);
            AddUser.CommandType = CommandType.StoredProcedure;
            AddUser.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
            AddUser.Parameters.Add("@PostText", SqlDbType.Text).Value = StatusText;
            NaitBookConnection.Open();
            int PostId = AddUser.ExecuteNonQuery();
            return PostId;

        }
        internal static DataSet GetAllPostsAdmin()
        { //AddPost(@UserId int ,@PostText text,@postedby int)
            DataSet AllPosts = null;
            AllPosts = new DataSet();
            AllPosts = LookupAllUsers();//AllUsers, "Users"
            SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString);
            SqlDataAdapter GetAllUsersAdapter = new SqlDataAdapter("Exec GetAllPosts", NaitBookConnection);
            
            GetAllUsersAdapter.Fill(AllPosts, "AllPosts");
            
            AllPosts.Relations.Add("Users_Posts", AllPosts.Tables["Users"].Columns["UserId"], AllPosts.Tables["AllPosts"].Columns["postedby"]);
            return AllPosts;
        }
        internal static DataSet GetAllAlbumsById( int UserId)
        {
            DataSet AllAlbums = null;
            SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString);
            SqlDataAdapter GetAllUsersAdapter = new SqlDataAdapter("Exec GetAllAlbumsById @UserId", NaitBookConnection);
            GetAllUsersAdapter.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
            AllAlbums = new DataSet();
            GetAllUsersAdapter.Fill(AllAlbums, "AllAlbums");
            return AllAlbums;
        }
        internal static DataSet GetPhotosByAlbumId(int AlbumId)
        {
            DataSet AllAlbums = null;
            SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString);
            SqlDataAdapter GetAllUsersAdapter = new SqlDataAdapter("Exec GetPhotosByAlbumId @AlbumId", NaitBookConnection);
            GetAllUsersAdapter.SelectCommand.Parameters.Add("@AlbumId", SqlDbType.Int).Value = AlbumId;
            AllAlbums = new DataSet();
            GetAllUsersAdapter.Fill(AllAlbums, "AllAlbums");
            return AllAlbums;
        }
        internal static int AddUserAlbums(int UserId , string AlbumName,string location,string albumDesc,string privacy)
        {   int AlbumID=0;
            SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString);
            SqlCommand AddUser = new SqlCommand("AddUserAlbums", NaitBookConnection);
            AddUser.CommandType = CommandType.StoredProcedure;
            AddUser.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
            AddUser.Parameters.Add("@AlbumName", SqlDbType.VarChar).Value = AlbumName;
            AddUser.Parameters.Add("@location", SqlDbType.VarChar).Value = location;
            AddUser.Parameters.Add("@albumDesc", SqlDbType.Text).Value = albumDesc;
            AddUser.Parameters.Add("@privacy", SqlDbType.VarChar).Value = privacy;
            NaitBookConnection.Open();
            int.TryParse(AddUser.ExecuteScalar().ToString(), out AlbumID);
            return AlbumID;
            
        }
        
        internal static void AddUserAlbumPhotos(int AlbumID, string PhotoName, string photocap, int cover)
        {
            SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString);
            SqlCommand AddUser = new SqlCommand("AddPhotosAlbums", NaitBookConnection);
            AddUser.CommandType = CommandType.StoredProcedure;
            AddUser.Parameters.Add("@AlbumId", SqlDbType.Int).Value = AlbumID;
            AddUser.Parameters.Add("@PhotoName", SqlDbType.VarChar).Value = PhotoName;
            AddUser.Parameters.Add("@Photocaption", SqlDbType.Text).Value = photocap;
            AddUser.Parameters.Add("@Album_cover", SqlDbType.Int).Value = cover;
            NaitBookConnection.Open();
            AddUser.ExecuteNonQuery();
        }
        internal static DataSet getFriendRequest(int UserId)
        {
            DataSet AllFriendRequests = null;
            DataSet sixFriendRequests = null;
            SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString);
            SqlDataAdapter GetAllUsersAdapter = new SqlDataAdapter("Exec GetFriendsById @UserId", NaitBookConnection);
            GetAllUsersAdapter.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
            AllFriendRequests = new DataSet();
            sixFriendRequests = new DataSet();
            GetAllUsersAdapter.Fill(AllFriendRequests, "AllFriendRequests");
            
            //for (i = 0; i < 7; i++)
            //{
            //    sixFriendRequests.Tables["AllFriendRequests"].Rows[i]=;
            //}
            return AllFriendRequests;//sixFriendRequests;
        }
        internal static void AddFriend(int FriendId, int UserId)
        {
            SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString);
            SqlCommand AddUser = new SqlCommand("AddFriendship", NaitBookConnection);
            AddUser.CommandType = CommandType.StoredProcedure;
            AddUser.Parameters.Add("@FriendshipId", SqlDbType.Int).Value = FriendId;
            AddUser.Parameters.Add("@UserId", SqlDbType.VarChar).Value = UserId;
            NaitBookConnection.Open();
            AddUser.ExecuteNonQuery();
        }
        internal static void RejectFriend(int FriendId, int UserId)
        {
            SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString);
            SqlCommand AddUser = new SqlCommand("RejectFriendship", NaitBookConnection);
            AddUser.CommandType = CommandType.StoredProcedure;
            AddUser.Parameters.Add("@FriendshipId", SqlDbType.Int).Value = FriendId;
            AddUser.Parameters.Add("@UserId", SqlDbType.VarChar).Value = UserId;
            NaitBookConnection.Open();
            AddUser.ExecuteNonQuery();
        }
        internal static int AddAlbumComment(int UserId, int AlbumId, int postedby, string CommentText)
        { //AddPost(@UserId int ,@PostText text,@postedby int)
            SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString);
            SqlCommand AddUser = new SqlCommand("AddComment", NaitBookConnection);
            AddUser.CommandType = CommandType.StoredProcedure;
            AddUser.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
            AddUser.Parameters.Add("@AlbumId", SqlDbType.Int).Value = UserId;
            AddUser.Parameters.Add("@postedby", SqlDbType.Int).Value = postedby;
            AddUser.Parameters.Add("@PostText", SqlDbType.Text).Value = CommentText;
            NaitBookConnection.Open();
            int PostId = AddUser.ExecuteNonQuery();
            return PostId;
        }
        internal static DataSet GetAlbumCommentsById(int UserId, int AlbumId)
        {
            DataSet myComments = null;
            using (SqlConnection NaitBookConnection = new SqlConnection(GlobalConstants.NaitBookConnectionString))
            {
                SqlDataAdapter LookupCommentAdapter =
                    new SqlDataAdapter("Exec GetAlbumCommentsById @userId,@AlbumId", NaitBookConnection);
                LookupCommentAdapter.SelectCommand.Parameters.Add
                    ("@UserId", SqlDbType.Int).Value = UserId;
                LookupCommentAdapter.SelectCommand.Parameters.Add
                    ("@AlbumId", SqlDbType.Int).Value = AlbumId;
                myComments = new DataSet();
                LookupCommentAdapter.Fill(myComments, "myComments");
            }
            return myComments;
        }
    }
}
