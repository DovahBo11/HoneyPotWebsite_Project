<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SandwichShop</title>
    <link href="~/StyleSheets/MainStyle.css"  rel="stylesheet" type="text/css"/>
</head>
<body style="background-color: gray">
    <form id="EntryForm" runat="server">
        <asp:RadioButton ID="VerificationCheck" runat="server" text="please check this to proceed" AutoPostBack="True" OnCheckedChanged="VerificationCheck_CheckedChanged"/>
        <asp:Menu ID="NavigationMenu" renderingmode="Table" CssClass="NagivagionMenu" runat="server" Orientation="Horizontal" BackColor="White">
            <Items>
                <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/HomePage.aspx" />
                <asp:MenuItem Text="|" Enabled="false" Selectable="false" />
                <asp:MenuItem Text="Place an Order" Value="Order" NavigateUrl="~/OrderPage.aspx" />
                <asp:MenuItem Text="|" Enabled="false" Selectable="false" />
                <asp:MenuItem Text="Contact Us" Value="ContactUs" NavigateUrl="~/ContactUsPage.aspx" />
            </Items>
        </asp:Menu>
        <div id="MainDiv" style="height: 164px; background-color: lightgoldenrodyellow;">
            <asp:Panel ID="scrollPanel" runat="server" style="height: 100%; overflow: auto;">
                <asp:Button ID="Button1" runat="server" Text="Button" />
                <br></br>
                <asp:Button ID="Button2" runat="server" Text="Button" />
                <br></br>
                <asp:Button ID="Button3" runat="server" Text="Button" />
                <br></br>
                <asp:Button ID="Button4" runat="server" Text="Button" />
                <br></br>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
