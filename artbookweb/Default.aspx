<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ArtfolioBook._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
      body{
	margin: 0px auto;
	background-image:url(images/spacer.jpg);
	background-repeat:repeat-x;
 }
table {
	text-align:right;
}
.con_body{ 
 	width: 850px;
	margin: 0px auto;
}
img.left {
	float: left;
	margin: 0px 30px 0 0;
}

h3{ 
	margin:0px; 
	padding: 10px ;
		color: #6c9d32; /*#39561D;*/
/*#39561D;*/
/*	border-bottom: 1px dashed #2D4516;*/
}
button #search{
background-image:url(images/go.jpg);
width:20px;
height:20px;
}

/* ************** ************** TOP NAV * ************** **************/
#header-wrapper{
	height: auto;
}

#header{
	width: 850px;
	height:40px;
	background-image:url(images/mgreyfill.jpg);
	background-repeat:repeat-x;
	display: block;

}
#menu LinkButton{
	width: 600px;
	height: 40px;
	margin: 0px 0px 0px 175px;
/*	border-bottom: 1px solid #2D4516;
*/
}

#menu ul,LinkButton {
	margin: 0;
	padding: 13px 0 0 20px;
	list-style: none;
	line-height: normal;
}

#menu li,LinkButton {
	display: block;
	float: right;
}

#menu a, LinkButton{
	display: block;
	float: right;
	margin-right: 17px;
	padding: 4px 12px;
	text-decoration: none;
	font: 14px Georgia, "Times New Roman", Times, serif;
	color: #303030;
}

#menu a:hover,LinkButton { text-decoration: underline; }
#menu .current_page_item a {
	background: #39561D;
	color: #FFFFFF;
}
/* ************** ************** CONTENT * ************** **************/
#Form1
{
	text-align:center;
}
#Message
{
	text-align:center;}
.left_con{
	float:left;
	width:457px;
	margin: 15px;
	padding: 10px;
}
.left_con #lmenu ul{
	margin: 0px;
	padding: 13px 0 0 20px;
	list-style: none;
	line-height: normal;
}
.left_con #lmenu li {
	display: inline;
	margin: 0px;
	padding: 0px;
}

.left_con #lmenu a {
	margin-right: 17px;
	padding: 4px 12px;
	text-decoration: none;
	font: 14px Georgia, "Times New Roman", Times, serif;
	color: #303030;
}
.left_con #lmenu a:hover { text-decoration: underline; }
.left_con #lmenu .current_page_item a {
	background: #39561D;
	color: #FFFFFF;
}
.left_con img{
	margin:0px 10px;
	padding: 5px 10px;
}
#uxPostRepeater ul
{
	margin-right: 17px;
	padding: 4px 12px;
	text-decoration: none;
	font: 14px Georgia, "Times New Roman", Times, serif;
	color: #303030;
	list-style: none;
	line-height: normal;
}
.left_con #uxPostRepeater li 
{
	display: inline;
	margin: 0px;
	padding: 0px;
}
.left_con #uxPostRepeater a
{
	margin-right: 17px;
	padding: 4px 12px;
	text-decoration: none;
	font: 14px Georgia, "Times New Roman", Times, serif;
	color: #303030;	
	background: #39561D;
}
.inner_left
{
	margin:0px;
	Padding:0px;
}
.right_con{
	float:left;
	width:325px;
	height:400px;
	margin-bottom:10px;
	background-color: #d4f1b3;

}
.right_con h2{
	color: #6c9d32;/*#fc911b;*/
}
.right_con h3{
	margin:0px; 
	padding: 10px 10px 0px 10px;
	color: #6c9d32;/*#fc911b;*/
	border-bottom: 1px dashed #2D4516;

}

/******************************   FOOTER **********************************************/
#footer{
	margin: 15px 0px;
	height:45px;
	background-image:url(images/lgreyfill_sm.jpg);
	background-repeat:repeat-x;
	background-color:#e8fad2;/*e6fbcd;*//*#ecf5e2;*/
}
      </style>
</head>
<body>
<div class="con_body">
<div id="header-wrapper">
	<div id="header">
	    <img class="left" src="images/logo.jpg" alt="Arfolio" title="artfolio" />
	</div>
	<br clear="all" />
</div>
	<div class="left_con">
       	<br />
		<img src="images/montsainte-victoirebypaulcezanne.jpg" width="150" height="100" alt="Painting" title="Paintings" />
	   	<img src="images/100181486_7776827cc9_b.jpg" width="150" height="100" alt="Drawing" title="Drawing" /><br clear="all" />
		<img src="images/sculpture.jpg" width="150" height="100"  alt="Arfolio" title="artfolio" />
		<img src="images/budda.jpg" width="150" height="160"  alt="Arfolio" title="artfolio"/>
	</div>

	<div class="right_con">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div>
        <asp:Repeater ID="uxUsersRepeater" runat="server">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <a href = "users/Artfolioprofile.aspx?userId=<%# DataBinder.Eval(Container, "DataItem.UserId") %>">
                        <%# DataBinder.Eval(Container, "DataItem.Full_Name") %>
                    </a>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
        </div>
    </form>
    </div>
</div>
</body>
</html>
