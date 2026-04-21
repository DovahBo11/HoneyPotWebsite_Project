<%@ Page Language="VB" AutoEventWireup="false" CodeFile="OrderPage.aspx.vb" Inherits="OrderPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/StyleSheets/MainStyle.css"  rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="OrderForm" runat="server">
        <div>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="MainOrderMenu" runat="server">
                    <h1 style="text-align:center">Place an Order</h1>
                    <p>To place an order, please contact us at:</p>
                    <p>Email:</p>
            </asp:MultiView>
        </div>
    </form>
</body>
</html>
