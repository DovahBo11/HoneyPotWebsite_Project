<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AboutUsPage.aspx.cs" Inherits="AboutUsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/StyleSheets/MainStyle.css"  rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Menu ID="NavigationMenu" renderingmode="Table" CssClass="NagivagionMenu" runat="server" Orientation="Horizontal" BackColor="White">
                <Items>
                    <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/HomePage.aspx" />
                    <asp:MenuItem Text="|" Enabled="false" Selectable="false" />
                    <asp:MenuItem Text="Place an Order" Value="Order" NavigateUrl="~/OrderingPage.aspx" />
                    <asp:MenuItem Text="|" Enabled="false" Selectable="false" />
                    <asp:MenuItem Text="About Us" Value="ContactUs" NavigateUrl="~/AboutUsPage.aspx" selectable="false"/>
                </Items>
            </asp:Menu>
            <asp:Table ID="DevTable" runat="server" HorizontalAlign="Center">
                <asp:TableRow HorizontalAlign="Center" VerticalAlign="Middle">
                    <asp:TableCell HorizontalAlign="Center" VerticalAlign="Middle">
                        <asp:ImageButton ID="AndrewViewBtn" runat="server" ImageUrl="~/Images/WIN_20260417_11_19_53_Pro.jpg" width="250px" OnClick="DevSelected_OnBtnClick"/>
                        <p>Andrew S. Huguenard</p>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        

        <asp:MultiView ID="Dev_MultiView" runat="server" OnActiveViewChanged="Dev_MultiView_ActiveViewChanged">
            <asp:View ID="Andrew_View" runat="server">
                <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Height="350px" BackColor="Snow">
                    <h1 style="text-align:center">About Andrew</h1>
                    <h2>Education/Qualifications</h2>
                    <ul>
                        <li>HighSchool Diploma</li>
                        <li>B.S. Computer Science (in progress)</li>
                    </ul>
                    <h2>Skills</h2>
                    <ul>
                        <li>Programming: Java, JavaScript, C#, Python, SQL</li>
                        <li>General Design</li>
                    </ul>
                    <h2>Exerience/Projects</h2>
                    <ul>
                        <li>ASL Robotic hand</li>
                        <li>Idle Necromancer game</li>
                    </ul>
                </asp:Panel>
            </asp:View>
        </asp:MultiView>
            </div>
    </form>
</body>
</html>
