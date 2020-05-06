<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Artfolioprofile.aspx.cs" Inherits="ArtfolioBook.users.Artfolioprofile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Profile Page</title>
    <meta name="Keywords" content="" />
<meta name="Description" content="" />
    <link href="../styles/styles.css" rel="Stylesheet" type="text/css" media="screen" />
    <style type="text/css">
        .modalBg 
        {
                    background-color:#6c9d32;
                    filter:alpha(opacity=90);
                    opacity:0.9;
                    width:190px;
                    height:189px;
        }
    </style>
</head>
<body>
<form id="uploadImg" runat="server">
<div class="con_body">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
       </asp:ScriptManager>
    <div id="header-wrapper">
	    <div id="header">
	        <img class="left" src="../images/logo.jpg" alt="Arfolio" title="artfolio" />
		    <div id="menu">	
			    <ul>	
				    <li><a href="imageupload.aspx?UserId=<%=this.conUserId%>">Photos</a></li>
                    <li><a href="ArtfolioProfAdmin.aspx?UserId=<%=this.conUserId%>">Admin</a></li>
			    </ul>
			    <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutPageUrl="../Default.aspx" /> 
		    </div>
	    </div>
	    <br />
    </div>
	<div class="left_con">
	    <asp:Image ID="uxProfileImage" class="left" runat="server" Height="150px" Width="150px" />
	    <h3><asp:Label ID="uxName" runat="server"></asp:Label><asp:Label ID="NewStatus" runat="server"></asp:Label><asp:LinkButton ID="clearstatus" runat="server" OnClick="clearStatus_Click">[clear]</asp:LinkButton>
            <asp:TextBox ID="StatusText" runat="server" Width="169px"></asp:TextBox></h3>
                    <a><asp:LinkButton ID="StatusButton" runat="server" OnClick="StatusButton_Click" Width="218px" Height="23px">What are you doing right now?</asp:LinkButton></a>
                    
                        <asp:TextBox ID="Post" runat="server" Width="113px"></asp:TextBox>
                    <a><asp:LinkButton ID="sub_Post" runat="server" OnClick="sub_PostButton_Click" Width="45px" Height="23px">Post</asp:LinkButton></a>
                <ul id="lmenu">
                <li class="current_page_item">&nbsp;
                </li>
                </ul>
                    <asp:Label ID="postlabel" runat="server" ForeColor="Maroon"></asp:Label>
            <asp:Repeater ID="uxPostRepeater" runat="server" >
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
    </div>
    <div class="right_con">
        <h3><asp:Label ID="FriendRequest" runat="server"></asp:Label></h3>
       <div>      
            <asp:Button ID="btn1" runat="server" CssClass="friendButton" Text="See Friend Request" OnClientClick="movePanel();" /> 
       </div>
       <br />
    <h3>friends</h3>
         <table>
   <asp:DataList ID="uxFriendDatalist" runat="server" DataKeyField="UserId" EnableViewState="False" RepeatColumns="3">
         <HeaderTemplate>
            <tr valign='top'>
         </HeaderTemplate>
             <ItemTemplate> 
                <td valign='top'> 
                    <a href="Artfolioprofile.aspx?UserId=<%# DataBinder.Eval(Container, "DataItem.UserId") %>">                   
                    <img id="Image1"  src='<%# DataBinder.Eval(Container, "DataItem.ImageLoc") %>' runat="server" alt='<%# DataBinder.Eval(Container, "DataItem.Full_Name")%>' height="85" width="85" />
                    <br />
                    <%# DataBinder.Eval(Container, "DataItem.Full_Name")%>
                    </a>  
              </td>  
              </ItemTemplate> 
        <FooterTemplate>
            </tr>
        </FooterTemplate>
     </asp:DataList></table>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ></asp:SqlDataSource>
        &nbsp;&nbsp;
        <br />
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
        <asp:Label ID="Label1" runat="server" Width="62px"></asp:Label>
    <br clear="all" />    
    </div>
     <br clear="all" />
      <asp:Panel ID="ModalPanel" runat="server" Width="500px">   
            <asp:Repeater ID="AddFriendRepeater" runat="server" >
            <HeaderTemplate>
                    <ul class="lmenu">
                </HeaderTemplate>
                <ItemTemplate >
                    <hr />
                    <br />
                    <li><a href="Artfolioprofile.aspx?UserId=<%# DataBinder.Eval(Container, "DataItem.Friend2Id") %>"><%# DataBinder.Eval(Container, "DataItem.FullName") %> </a>Wants to be friends...Do you?
                        <asp:Button ID="Reject" runat="server" CssClass="buttonClass" Text="Reject" Width="50px" OnClick="Cancel_Click" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Friend2Id")%>' />
                        <asp:Button ID="Accept" runat="server" CssClass="buttonClass" Text="Accept" OnClick="Save_Click"  CommandArgument='<%# DataBinder.Eval(Container, "DataItem.Friend2Id")%>'/>
                    </li>
                    <br />
                    </ItemTemplate>
                <FooterTemplate>
                    </ul>
                    <br />
                </FooterTemplate>
            </asp:Repeater> 
            <br /><br />
        <asp:Button ID="OKButton" CssClass="buttonClass" runat="server" Text="Close" /> 
    </asp:Panel>
        <cc1:ModalPopupExtender BackgroundCssClass = "modalBg" ID="ModalPopupExtender1" runat="server" targetcontrolid="btn1" popupcontrolid="ModalPanel" OkControlID="OKButton"      OnOkScript="stopMoving();">
        </cc1:ModalPopupExtender>
    
</div>
 </form>
 
</body>
</html>
