<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxxTestForm.aspx.cs" Inherits="ArtfolioBook.users.AjaxxTestForm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript"> 
         var id = null;      
         function movePanel()      
         {           
             var pnl = $get("ModalPanel");           
             if (pnl != null)           
             {                
                 pnl.style.left = "250px";                
                 pnl.style.top = "50px";                
                 id = setTimeout("movePanel();", 100);           
             }      
         }
         function stopMoving()      
         {           
            clearTimeout(id);      
         } 
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <div>
    <asp:Label ID="FriendRequest" runat="server"></asp:Label>
       <div>      
            <asp:Button ID="btn1" runat="server" Text="See Friend Request" OnClientClick="movePanel();" /> 
       </div>
       <asp:Panel ID="ModalPanel" runat="server" Width="500px">   
       
            <asp:Repeater ID="AddFriendRepeater" runat="server" >
            <HeaderTemplate>
                    <ul class="lmenu">
                </HeaderTemplate>
                <ItemTemplate >
                    <hr />
                    <li><%# DataBinder.Eval(Container, "DataItem.Friend2Id") %>
                    
                        <asp:Button ID="Cancel" runat="server" CssClass="buttonClass" Text="Cancel" Width="50px" OnClick="Cancel_Click" />
                        <asp:Button ID="Save" runat="server" CssClass="buttonClass" Text="Save" OnClick="Save_Click" />
                    </li>
                    </ItemTemplate>
                <FooterTemplate>
                    </ul>
                    <br />
                </FooterTemplate>
            </asp:Repeater>
         
        ASP.NET AJAX is a free framework for quickly creating a new generation of more      
        efficient, more interactive and highly-personalized Web experiences that work      
        across all the most popular browsers.<br />      
        <asp:Button ID="OKButton" runat="server" Text="Close" /> 
        <asp:Button ID="AcceptButton" runat="server" Text="Accept" /> 
    </asp:Panel>
        <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" targetcontrolid="btn1" popupcontrolid="ModalPanel" OkControlID="OKButton"      OnOkScript="stopMoving();">
        </cc1:ModalPopupExtender>
    </div>
   </form>
</body>
</html>
