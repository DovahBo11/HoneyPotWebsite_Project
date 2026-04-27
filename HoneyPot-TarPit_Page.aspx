<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HoneyPot-TarPit_Page.aspx.cs" Inherits="HoneyPot_TarPit_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Loading...</title>
    <script>
        // Prevent back button escape (works on many browsers, not all)
        history.pushState(null, "", location.href);
        window.onpopstate = function () {
            history.pushState(null, "", location.href);
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Processing...</h1>
        <p>Please wait.</p>

        <asp:Literal ID="BigJunkHtml" runat="server"></asp:Literal>
    </form>
</body>
</html>
