<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArtfolioProfAdmin.aspx.cs" Inherits="NaitbookWeb.NaitBookUserUpdate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Update Page</title>
    <meta name="Keywords" content="" />
<meta name="Description" content="" />
    <link href="../styles/styles.css" rel="Stylesheet" type="text/css" media="screen" />
</head>
<body>
<form id="uploadImg" runat="server">
<div class="con_body">
<div id="header-wrapper">
	<div id="header">
	<img class="left" src="../images/logo.jpg" alt="Arfolio" title="artfolio" />
		<div id="menu">	
			<ul>	
				<li><a href="imageupload.aspx?UserId=<%=this.UserId%>">Photos</a></li>
                <li><a href="Artfolioprofile.aspx?UserId=<%=this.UserId%>"><%=this.uxName%></a></li>
			</ul>
			    <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutPageUrl="Default.aspx" /> 
		</div>
	</div>
	<br />
  </div>
	<div class="left_con">
    <div class="right_con">
    <h3>Update <%=this.uxName%></h3>
    <table>
            <tr><td>Full Name:</td>
                <td style="width: 191px"><asp:TextBox runat="server" id="sFUname" ReadOnly="True"  /></td></tr>
            <tr><td>email:</td>
                <td style="width: 191px"><asp:TextBox runat="server" id="semail"  /></td></tr>
            <tr><td style="height: 26px">New Password:</td>
                <td style="width: 191px; height: 26px;"><asp:TextBox runat="server" id="spassword" textmode="Password"  /></td></tr>
            <tr><td>Retype Password:</td>
                <td style="width: 191px"><asp:TextBox runat="server" id="spasswordCheck" textmode="Password"  /></td></tr>
 			<tr><td>Sex:</td>
				<td style="width: 191px">
                <asp:DropDownList ID="ssex" runat="server" Enabled="False">
                    <asp:ListItem Text="M" Value="M"></asp:ListItem>
                    <asp:ListItem Text="F" Value="F"></asp:ListItem>
                </asp:DropDownList>
            </td></tr> 
			<tr><td>Birthdate:</td>
				<td style="width: 191px">
                    &nbsp;<asp:TextBox ID="sMonth" runat="server" ForeColor="Silver" Width="21px" ReadOnly="True">mm</asp:TextBox>
                    <asp:TextBox ID="sDay" runat="server" ForeColor="Silver"  Width="24px" ReadOnly="True">dd</asp:TextBox>
                    <asp:TextBox ID="sYear" runat="server" ForeColor="Silver" Width="46px" ReadOnly="True">yyyy</asp:TextBox>&nbsp;
                </td></tr>
			<tr><td></td>
				<td style="width: 191px"><asp:Button runat="server" id="update" text="update" onclick="update_Click" /></td></tr>
        </table>

      
                    <asp:Label ID="Label1" runat="server" Text="Label" Height="35px" Width="311px" ForeColor="Maroon"></asp:Label>&nbsp;
        
            <asp:Button ID="DeleteUser" runat="server" Text="Delete User" OnClick="DeleteUser_Click" />
        <h3>
            newsfeed</h3>
    </div>
	</div>
	   </div>
</form>
</body>
</html>
