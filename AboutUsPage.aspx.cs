using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class AboutUsPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
        }
    }


    protected void DevSelected_OnBtnClick(object sender, EventArgs e)
    {
            if (sender is ImageButton)
            {
                string controllerName = (sender as ImageButton).ID;
                //trying to check which button is clicked and then change the view accordingly
                if (controllerName == "AndrewViewBtn")
                {
                    if (Dev_MultiView.ActiveViewIndex != 0)
                    {
                        Dev_MultiView.ActiveViewIndex = 0;
                    }
                    else
                    {
                        Dev_MultiView.ActiveViewIndex = -1;
                    }
                }
            }
    }
    protected void Dev_MultiView_ActiveViewChanged(object sender, EventArgs e)
    {

    }
}