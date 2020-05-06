<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ArtfolioBook.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
   <link href="styles/styles.css" rel="Stylesheet" type="text/css" media="screen" />
    <title>Artfolio - Login</title>
  </head>
  <body>
<div class="con_body">
<div id="header-wrapper">
	<div id="header">
	<img class="left" src="../images/logo.jpg" alt="Arfolio" title="artfolio"  />
	</div>
</div>
    <form id="Form1" method="post" runat="server">
        <table><h3>
            &nbsp;Artfolio Login</h3>
            <tr><td>Userid:</td>
                <td><asp:TextBox Runat="server" ID="UserLogonId" /></td></tr>
            <tr><td>Password:</td>
                <td><asp:TextBox Runat="server" ID="UserPassword" TextMode="Password"  /></td></tr>
            <tr><td><asp:Button runat="server" ID="Logon" Text="Logon" OnClick="Logon_Click" /></td>
                <td><asp:CheckBox Runat="server" ID="RememberMe" Checked="False" />Remember me on this computer.</td></tr>
        </table>
        <h3><a href="ArtfolioSignup.aspx">new to artfolio?</a></h3> 
    </form>
    <div style='color:red'>
        <asp:Literal Runat="server" ID="Message" />
    </div>
  </div>
  </body>
</html>
