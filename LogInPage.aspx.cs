using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LogInPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LogIn_Authenticate(object sender, AuthenticateEventArgs e)
    {
        if(LogIn.UserName == "admin" && LogIn.Password == "password")
        {
            Session["Authenticated"]= true;
            e.Authenticated = true;
            Response.Redirect("HomePage.aspx");
        }
        else
        {
            e.Authenticated = false;
        }

    }
}