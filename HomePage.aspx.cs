using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HomePage : System.Web.UI.Page
{
    protected void Check_ifTarpit(object sender, EventArgs e)
    {
        if (Session["InTarpit"] != null && Session["InTarpit"] is bool inTarpit && inTarpit)
        {
            Response.Redirect("HoneyPot-TarPit_Page.aspx");
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Check_ifTarpit(this, EventArgs.Empty);
        if (Session["Authenticated"] is true)
        {
            // Only add "Orders" if it doesn't already exist
            bool ordersExists = NavigationMenu.Items.Cast<MenuItem>()
                .Any(item => item.Text == "Orders" && item.NavigateUrl == "Orders.aspx");
            if (!ordersExists)
            {
                // create a non-interactable separator
                var separator = new MenuItem("|");
                separator.Selectable = false;
                separator.Enabled = false;
                NavigationMenu.Items.Add(separator);

                NavigationMenu.Items.Add(new MenuItem("Orders", "", "", "~/Records/Orders.aspx"));
            }
            LogOutBTN.Visible = true;
        }
    }

    protected void VerificationCheck_CheckedChanged(object sender, EventArgs e)
    {
        if(VerificationCheck.Checked)
        {
            Response.Redirect("HoneyPot-TarPit_Page.aspx");
        }
    }

    protected void LogInBTN_Click(object sender, EventArgs e)
    {
        Response.Redirect("LogInPage.aspx");
    }

    protected void LogOutBTN_Click(object sender, EventArgs e)
    {
        Session["Authenticated"] = false;

        // Remove Orders item
        var ordersItem = NavigationMenu.Items.Cast<MenuItem>()
            .FirstOrDefault(i => i.Text == "Orders");

        if (ordersItem != null)
            NavigationMenu.Items.Remove(ordersItem);

        // Remove the separator "|" (last one added)
        var separatorItem = NavigationMenu.Items.Cast<MenuItem>()
            .FirstOrDefault(i => i.Text == "|");

        if (separatorItem != null)
            NavigationMenu.Items.Remove(separatorItem);

        LogOutBTN.Visible = false;

        Response.Redirect(Request.RawUrl); // refresh page so Page_Load rebuilds correctly
    }
}