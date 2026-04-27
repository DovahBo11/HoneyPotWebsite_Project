<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogInPage.aspx.cs" Inherits="LogInPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Login ID="LogIn" runat="server" Height="273px" OnAuthenticate="LogIn_Authenticate" Width="448px" >
            </asp:Login>
        </div>
    </form>
</body>
</html>
