<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderingPage.aspx.cs" Inherits="OrderingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <link href="~/StyleSheets/MainStyle.css"  rel="stylesheet" type="text/css"/>

</head>
<body>
    <form id="OrderForm" runat="server">
        <div style="height:600px">
            <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                <asp:View ID="MainOrderMenu" runat="server">
                     <asp:Menu ID="NavigationMenu" renderingmode="Table" CssClass="NagivagionMenu" runat="server" Orientation="Horizontal" BackColor="White">
                         <Items>
                             <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/HomePage.aspx"/>
                             <asp:MenuItem Text="|" Enabled="false" Selectable="false" />
                             <asp:MenuItem Text="Place an Order" Value="Order" NavigateUrl="~/OrderingPage.aspx" selectable="false"/>
                             <asp:MenuItem Text="|" Enabled="false" Selectable="false" />
                             <asp:MenuItem Text="About Us" Value="ContactUs" NavigateUrl="~/AboutUsPage.aspx" />
                         </Items>
                     </asp:Menu>
                    <h1 style="text-align:center">Place an Order</h1>
                    <p>Name:
                        <asp:TextBox ID="CustomerNameTxtBx" runat="server" OnTextChanged="CustomerNameTxtBx_TextChanged"></asp:TextBox>
                    </p>
                    <p>Email:
                        <asp:TextBox ID="CustomerEmailTxtBx" runat="server" OnTextChanged="CustomerEmailTxtBx_TextChanged"></asp:TextBox>
                    </p>
                    <asp:DropDownList ID="DeliveryTypeDropDownMenu" runat="server" OnSelectedIndexChanged="DeliveryTypeDropDownMenu_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Value="Pickup">Pickup</asp:ListItem>
                        <asp:ListItem>Delivery</asp:ListItem>
                     </asp:DropDownList>
                    <asp:Label ID="AddressLBL" runat="server" Text="Address: " Visible="False"></asp:Label>
                    <asp:TextBox ID="AddressTxtBx" runat="server" Visible="False" AutoPostBack="True"></asp:TextBox>
                    <br />

                    <asp:DropDownList ID="OrderItemSelectionDropDownMenu" runat="server" AutoPostBack="True" OnSelectedIndexChanged="OrderItemSelectionDropDownMenu_SelectedIndexChanged">
                        <asp:ListItem Value="0">Choose an OrderItem</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="RmvOrderItemBTN" runat="server" Text="-" OnClick="RmvOrderItemBTN_Click" />
                    <asp:Button ID="AddOrderItemBTN" runat="server" Text="+" OnClick="AddOrderItemBTN_Click" />
                    <asp:MultiView ID="OrderItemSelectionMultiView" runat="server" ActiveViewIndex="0">
                        <asp:View ID="waitView" runat="server">
                            <p>please select an option</p>
                        </asp:View>
                        <asp:View ID="OrderItemSelectionView" runat="server">
                            <p>meats: 
                                <asp:DropDownList ID="MeatSelectionDropDownMenu" runat="server"></asp:DropDownList>
                                <asp:Label ID="MeatsLBL" runat="server" Text="Selected:"></asp:Label>
                                <asp:PlaceHolder ID="MeatsPlaceHolder" runat="server"></asp:PlaceHolder>
                            </p>
                            <p>Spreads: 
                                <asp:DropDownList ID="SpreadSelectionDropDownMenu" runat="server"></asp:DropDownList>
                                <asp:Label ID="SpreadsLBL" runat="server" Text="Selected:"></asp:Label>
                                <asp:PlaceHolder ID="SpreadsPlaceHolder" runat="server"></asp:PlaceHolder>
                            </p>
                            <p>Toppings: 
                                <asp:DropDownList ID="ToppingSelectionDropDownMenu" runat="server"></asp:DropDownList>
                                <asp:Label ID="ToppingsLBL" runat="server" Text="Selected:"></asp:Label>
                                <asp:PlaceHolder ID="ToppingsPlaceHolder" runat="server"></asp:PlaceHolder>
                            </p>
                        </asp:View>
                    </asp:MultiView>
                </asp:View>
            </asp:MultiView>
        </div>
    </form>
</body>
</html>