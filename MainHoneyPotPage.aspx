<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainHoneyPotPage.aspx.cs" Inherits="MainHoneyPotPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SandwichShop</title>
</head>
<body style="background-color: gray">
    <form id="EntryForm" runat="server">
        <asp:Menu ID="NavigationMenu" style="width: 100%" runat="server" Orientation="Horizontal" BackColor="White">
            <Items>
                <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/MainHoneyPotPage.aspx" />
                <asp:MenuItem Text="Place an Order" Value="Order" NavigateUrl="~/OrderPage.aspx" />
                <asp:MenuItem Text="Contact Us" Value="ContactUs" NavigateUrl="~/ContactUs.aspx" />
            </Items>
        </asp:Menu>
        <div style="height: 164px; background-color: lightgoldenrodyellow;">
        </div>
    </form>
</body>
</html>
