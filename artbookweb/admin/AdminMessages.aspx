<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminMessages.aspx.cs" Inherits="ArtfolioBook.admin.AdminMessages" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>User Messages</title>
</head>
<body>
    <form id="form1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div>
        <asp:Repeater ID="uxUsersRepeater" runat="server">
            <ItemTemplate>
                <h3>
                    <a href = "users/Artfolioprofile.aspx?userId=<%# DataBinder.Eval(Container, "DataItem.UserId") %>">
                        <%# DataBinder.Eval(Container, "DataItem.Full_Name") %>
                    </a>
                </h3>
                <asp:Repeater ID="uxUserPostRepeater" runat="server"
                 EnableViewState='false' DataSource='<%# ((System.Data.DataRowView)Container.DataItem).CreateChildView("Users_Posts") %>'>
                        <HeaderTemplate>
                             <ul class="lmenu">
                        </HeaderTemplate>
                            <ItemTemplate >
                                <li><%# DataBinder.Eval(Container, "DataItem.myPost")%> posted at: <%# DataBinder.Eval(Container, "DataItem.Postdate")%></li>
                            </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                </asp:Repeater>
            </ItemTemplate>
        </asp:Repeater>
        </div>
    </form>
</body>
</html>
