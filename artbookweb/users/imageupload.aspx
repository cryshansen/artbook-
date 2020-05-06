<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="imageupload.aspx.cs" Inherits="NaitbookWeb.imageupload" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Artfolio - Upload your Picture</title>
    <link href="../styles/styles.css" rel="Stylesheet" type="text/css" media="screen" />
    <style type="text/css">
        .modalBg 
        {
                    background-color:#6c9d32;
                    filter:alpha(opacity=50);
                    opacity:0.5;
                    width:190px;
                    height:189px;
        }
    </style>
</head>
<body>
<div class="con_body">
<form id="imageUpload" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
       </asp:ScriptManager>
    <div id="header-wrapper">
	    <div id="header" onclick="return header_onclick()">
	        <img class="left" src="../images/logo.jpg" alt="Arfolio" title="artfolio" />
		    <div id="menu">	
			    <ul>	
<%--				    <li><input type="text" /><input value="search" type="button" /></li>--%>
				    <li class="current_page_item"><a href="Artfolioprofile.aspx?UserId=<%= this.UserId %>"><%= this.UserName %></a></li>
				    <li><a href="ArtfolioProfAdmin.aspx?UserId=<%= this.UserId %>">Admin</a></li>
			    </ul>
			    <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutPageUrl="../Default.aspx" /> 
		    </div>
	    </div>
	</div>
	<br />
	
	<asp:Button ID="CreateAlbum" runat="server" OnClick="CreateAlbum_Click" Text="+ Create an Album" CssClass="buttonClass" Width="123px" />
    <div class="left_con">
    	    <asp:Image ID="uxProfileImage" class="left" runat="server" Height="47px" Width="47px" />
	    <h3><asp:Label ID="uxName" runat="server">  </asp:Label> is <asp:Label ID="NewStatus" runat="server"></asp:Label></h3>
	    <br />
        <h3><asp:Label ID="uxTitle" runat="server"></asp:Label></h3>
        
        <table><!--if AlbumId is set then display all images in album 
        else display the choice of albums and manage bs if album id is set 
        offer the add album button to upload an image to the albumn
        Get rid of submit button or change it to add image-->
        <asp:DataList ID="uxAlbumList" runat="server" RepeatColumns="3" >
            <HeaderTemplate>
               <tr>
            </HeaderTemplate>
               <ItemTemplate >
                <td>
                <a href = "imageupload.aspx?UserId=<%# DataBinder.Eval(Container, "DataItem.UserId") %>&AlbumId=<%# DataBinder.Eval(Container, "DataItem.AlbumId") %>"><img src='<%# DataBinder.Eval(Container, "DataItem.url") %>' alt="<%# DataBinder.Eval(Container, "DataItem.AlbumName") %>" height="100" width="100" />
                <br />
                <%# DataBinder.Eval(Container, "DataItem.AlbumName") %></a>
                </td>
                </ItemTemplate>
             <FooterTemplate>
                 </tr>
            </FooterTemplate>
        </asp:DataList>
        </table> 
        <p>Comment:</p>
        <asp:Repeater ID="uxImageCommentsRepeater" runat="server" >
                <HeaderTemplate>
                    <ul class="lmenu">
                </HeaderTemplate>
                <ItemTemplate >
                    <hr />
                    <li>
                    <a href = "Artfolioprofile.aspx?UserId=myfriends"><img src='<%# DataBinder.Eval(Container, "DataItem.ImageLoc") %>' alt="<%# DataBinder.Eval(Container, "DataItem.Name") %>" height="35" width="35" /><%# DataBinder.Eval(Container, "DataItem.Name") %></a>
                   wrote at <%# DataBinder.Eval(Container, "DataItem.Postdate") %><br />
                  <%# DataBinder.Eval(Container, "DataItem.myPost") %>
				
                    </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                    <br />
                </FooterTemplate>
            </asp:Repeater>
        <asp:TextBox ID="ImageComment" runat="server" Width="169px"></asp:TextBox>
                    <a><asp:LinkButton ID="CommentButton" runat="server" OnClick="CommentButton_Click" Width="218px" Height="23px">What do you think of this?</asp:LinkButton></a>
                          
            <br />
          <asp:Button ID="AddImages" runat="server" OnClick="AddImages_Click" Text="addImages" CssClass="buttonClass" Width="130px" /><br />
          <br />
          <asp:Button ID="DeleteImages" runat="server" OnClick="DeleteImage_Click" Text="DeleteImage" CssClass="buttonClass" Width="130px" /><br />
        
<asp:Label ID="Label1" runat="server" Height="54px" Width="250px"></asp:Label>
	        <br />
    </div> 
   <div class="right_con">
       
      <h3>newsfeed</h3>
        <asp:Repeater ID="uxFriendStatusRepeater" runat="server">
                <HeaderTemplate>
                    <ul>
                </HeaderTemplate>
                <ItemTemplate>
                    <li>
                        <a href = "Artfolioprofile.aspx?UserId=<%# DataBinder.Eval(Container, "DataItem.UserId") %>">
                            <%# DataBinder.Eval(Container, "DataItem.Full_Name")%>
                        </a>
                        <%# DataBinder.Eval(Container, "DataItem.myStatus")%> at <%# DataBinder.Eval(Container, "DataItem.dt")%>
                        </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </asp:Repeater>
      <h3>Upload your profile pix</h3>
        <asp:LinkButton ID="uploadNewPic" runat="server" OnClick="uploadProfileImage_Click">[here]</asp:LinkButton>
       
    </div>
     <asp:UpdatePanel ID="uxAddProfileImage" runat="server">
        <ContentTemplate>
            <asp:FileUpload ID="Profile_Image" runat="server" Width="268px" CssClass="buttonClass"/>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Submit_Click" Text="Submit" CssClass="buttonClass" Width="81px" /><br />
            <asp:Label ID="uxFileInfo" runat="server" Height="32px" Width="250px"></asp:Label>
	        <br />
	     </ContentTemplate>
	 </asp:UpdatePanel>
    <asp:UpdatePanel ID="uxAddAlbum" runat="server">
        <ContentTemplate>
            <table>
                <tr>
                    <td>Album Name:</td><td style="width: 40px">
                        <asp:TextBox ID="AlbumName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Location:</td><td>
                        <asp:TextBox ID="AlbumLocation" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Album Descripion:</td><td>
                        &nbsp;<asp:TextBox ID="ADescription" runat="server" Height="114px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Album Name:</td><td>
                        <asp:DropDownList ID="PrivacyList" runat="server">
                            <asp:ListItem Text="No One" Value='1'></asp:ListItem>
                            <asp:ListItem Text="Everyone" Value='2'></asp:ListItem>
                            <asp:ListItem Text="Only Friends" Value='3'></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td style="height: 26px"></td><td style="height: 26px">
                        <asp:Button ID="Cancel" runat="server" CssClass="buttonClass" Text="Cancel" Width="50px" OnClick="Cancel_Click" />
                        <asp:Button ID="Save" runat="server" CssClass="buttonClass" Text="Save" OnClick="Save_Click" />
                    </td>
                
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
           <cc1:ModalPopupExtender BackgroundCssClass = "modalBg" 
           ID="ModalPopupExtender1" runat="server" 
           TargetControlID= "CreateAlbum" 
           PopupControlID="uxAddAlbum" 
           OkControlID="Cancel"> 
       </cc1:ModalPopupExtender>
       
       <asp:UpdatePanel ID="uxAddImages" runat="server">
        <ContentTemplate>
            <table>
            <tr>
                <td colspan='2'><asp:FileUpload ID="FileUpload1" runat="server" Width="268px" CssClass="buttonClass"/>
                </td>
            </tr>
                <tr>
                    <td>Photo Caption:</td><td>
                        &nbsp;<asp:TextBox ID="photoCaption" runat="server" Height="114px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Album Name:</td><td>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Text="No One" Value='1'></asp:ListItem>
                            <asp:ListItem Text="Everyone" Value='2'></asp:ListItem>
                            <asp:ListItem Text="Only Friends" Value='3'></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td style="height: 26px"></td><td style="height: 26px">
                        <asp:Button ID="Button2" runat="server" CssClass="buttonClass" Text="Cancel" Width="50px" OnClick="CancelImage_Click" />
                        <asp:Button ID="Button3" runat="server" CssClass="buttonClass" Text="Save" OnClick="SaveImage_Click" />
                    </td>
                
                </tr>
            </table>
        </ContentTemplate>
       </asp:UpdatePanel>
       <cc1:ModalPopupExtender BackgroundCssClass = "modalBg" 
           ID="ModalPopupExtender2" runat="server" 
           TargetControlID= "AddImages" 
           PopupControlID="uxAddImages" 
           OkControlID="Cancel Image"> 
       </cc1:ModalPopupExtender>
       
       <cc1:ModalPopupExtender BackgroundCssClass = "modalBg" 
           ID="ModalPopupExtender3" runat="server" 
           TargetControlID= "uploadNewPic" 
           PopupControlID="uxAddProfileImage" 
           OkControlID="Cancel New Pic"> 
       </cc1:ModalPopupExtender>
   </form>  
    
  </div>
</body>
</html>


<!--[if lte IE 6]><link rel="stylesheet" href="" type="text/css"/><![endif]-->
<!--[if IE 7]><link rel="stylesheet" href="" type="text/css"/><![endif]-->

