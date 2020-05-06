<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArtfolioSignup.aspx.cs" Inherits="ArtfolioBook.ArtfolioSignup" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
   <link href="styles/styles.css" rel="Stylesheet" type="text/css" media="screen" />
    <title>Artfolio - Signup</title>

</head>
<body>
<div class="con_body">
<div id="header-wrapper">
	<div id="header">
	<img class="left" src="../images/logo.jpg" alt="Arfolio" title="artfolio"  />
	</div>
</div>
    <form id="Form1" runat="server">
          <h3>new to artfolio?</h3>
        <table>
         <tr><td>Username:</td>
                <td style="width: 191px"><asp:TextBox runat="server" id="sUname"  /></td></tr>
            <tr><td>First Name:</td>
                <td style="width: 191px"><asp:TextBox runat="server" id="sFUname"  /></td></tr>
             <tr><td>Last Name:</td>
                <td style="width: 191px"><asp:TextBox runat="server" id="sLUname"  /></td></tr>
            <tr><td>email:</td>
                <td style="width: 191px"><asp:TextBox runat="server" id="semail"  /></td></tr>
            <tr><td>New Password:</td>
                <td style="width: 191px"><asp:TextBox runat="server" id="spassword" textmode="Password"  /></td></tr>
             <tr><td>Retype Password:</td>
                <td style="width: 191px"><asp:TextBox runat="server" id="spasswordCheck" textmode="Password"  /></td></tr>
 			<tr><td>Sex:</td>
				<td style="width: 191px">
                <asp:DropDownList ID="ssex" runat="server">
                    <asp:ListItem Text="M" Value="M"></asp:ListItem>
                    <asp:ListItem Text="F" Value="F"></asp:ListItem>
                </asp:DropDownList>
 <%--              <asp:TextBox runat="server" id="msex" ForeColor="Silver" Width="16px" >M</asp:TextBox>
  --%>             </td></tr> 
			<tr><td>Birthdate:</td>
				<td style="width: 191px">
                    &nbsp;<asp:TextBox ID="sMonth" runat="server" ForeColor="Silver" Width="21px">mm</asp:TextBox>
                    <asp:TextBox ID="sDay" runat="server" ForeColor="Silver"  Width="24px">dd</asp:TextBox>
                    <asp:TextBox ID="sYear" runat="server" ForeColor="Silver" Width="46px">yyyy</asp:TextBox>&nbsp;
                </td></tr>
			<tr><td><asp:CheckBox Runat="server" ID="RememberMe" Checked="False" />Remember me on this computer.</td>
				<td style="width: 191px"><asp:Button runat="server" id="ssignup" text="sign up" onclick="signup_Click" /></td></tr>
        </table>
    </form>
    <div style='color:red'>
        <asp:Literal Runat="server" ID="Message" />
    </div>
 </div>
</body>
</html>
