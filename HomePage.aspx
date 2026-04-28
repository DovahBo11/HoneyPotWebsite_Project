<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SandwichShop</title>
    <link href="~/StyleSheets/MainStyle.css"  rel="stylesheet" type="text/css"/>
</head>
<body style="background-color: gray">
    <form id="EntryForm" runat="server">
        <asp:RadioButton ID="VerificationCheck" runat="server" text="please check this to proceed" AutoPostBack="True" OnCheckedChanged="VerificationCheck_CheckedChanged" Visible="False"/>
        <br />
        <asp:Button ID="LogInBTN" runat="server" Text="Log In" OnClick="LogInBTN_Click" Width="206px"  />
        <asp:Button ID="LogOutBTN" runat="server" Text="LogOut" OnClick="LogOutBTN_Click" Visible="False" />
        <asp:Menu ID="NavigationMenu" renderingmode="Table" CssClass="NagivagionMenu" runat="server" Orientation="Horizontal" BackColor="White">
            <Items>
                <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/HomePage.aspx" selectable="false"/>
                <asp:MenuItem Text="|" Enabled="false" Selectable="false" />
                <asp:MenuItem Text="Place an Order" Value="Order" NavigateUrl="~/OrderingPage.aspx" />
                <asp:MenuItem Text="|" Enabled="false" Selectable="false" />
                <asp:MenuItem Text="About Us" Value="ContactUs" NavigateUrl="~/AboutUsPage.aspx" />
            </Items>
        </asp:Menu>
        <div id="MainDiv" style="height: 164px; background-color: lightgoldenrodyellow;">
            <asp:Panel ID="scrollPanel" runat="server" style="height: 200%; overflow: auto;">
                <asp:Image ID="SandwichImage" runat="server" ImageUrl="~/Images/Sanchwich_image.jpg" />
                <br />
                <asp:Button ID="Button1" runat="server" Text="Button" />
                <br>
                <br></br>
                <asp:Button ID="Button2" runat="server" Text="Button" />
                <br>
                <br></br>
                <asp:Button ID="Button3" runat="server" Text="Button" />
                <br>
                <br></br>
                <asp:Button ID="Button4" runat="server" Text="Button" />
                <br>
                <br></br>
                </br>
                </br>
                </br>
                </br>
            </asp:Panel>
            <asp:Panel ID="LocationPanel" runat="server">
                <h2>Address</h2>
                <p>#### str state country</p>
                <h2>contact us</h2>
                <p>(###)-###-####</p>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
