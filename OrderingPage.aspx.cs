using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderingPage : System.Web.UI.Page
{
    //class that is in App_Code/OrderingClasses.cs
    private SandWichOrder currentOrder;

    protected void PopulateOrderItemsMenu()
    {
        // This method can be called to populate the dropdown menu with the current order items
        OrderItemSelectionDropDownMenu.Items.Clear();
        foreach (OrderItem item in currentOrder.OrderItems)
        {
            // Add ListItem with display text and value
            OrderItemSelectionDropDownMenu.Items.Add(new ListItem($"OrderItem {item.ID}", item.ID.ToString()));
        }
        //OrderItemSelectionDropDownMenu.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (Session["CurrentOrder"] != null)
        {
            currentOrder = (SandWichOrder)Session["CurrentOrder"];
        }
        else
        {
            currentOrder = new SandWichOrder();
            currentOrder.OrderItems = new List<OrderItem>();
            Session["CurrentOrder"] = currentOrder;
        }

        if (!IsPostBack)
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
            CustomerNameTxtBx.Text = currentOrder.CustomerName;
            CustomerEmailTxtBx.Text = currentOrder.Email;

            PopulateOrderItemsMenu();
        }

    }

    protected void CustomerNameTxtBx_TextChanged(object sender, EventArgs e)
    {
        currentOrder.CustomerName = CustomerNameTxtBx.Text;
    }

    protected void CustomerEmailTxtBx_TextChanged(object sender, EventArgs e)
    {
        currentOrder.Email = CustomerEmailTxtBx.Text;
    }

    protected void DeliveryTypeDropDownMenu_SelectedIndexChanged(object sender, EventArgs e)
    {
        currentOrder.DeliveryType = DeliveryTypeDropDownMenu.SelectedValue;
        if (currentOrder.DeliveryType == "Delivery")
        {
            AddressLBL.Visible = true;
            AddressTxtBx.Visible = true;
            if (!string.IsNullOrEmpty(currentOrder.Address))
            {
                AddressTxtBx.Text = currentOrder.Address;
            }
        }
        else
        {
            AddressLBL.Visible = false;
            AddressTxtBx.Visible = false;
            currentOrder.Address = string.Empty; // Clear the address if not delivery
        }
    }

    protected void AddOrderItemBTN_Click(object sender, EventArgs e)
    {
        if (currentOrder == null)
        {
            currentOrder = new SandWichOrder { OrderItems = new List<OrderItem>() };
        }
        currentOrder.OrderItems.Add(new OrderItem
        {
            ID = currentOrder.OrderItems.Count + 1,
            ItemType = "Custom",
            Meats = new Dictionary<string, (int, int)>(),
            Spreads = new Dictionary<string, (int, int)>(),
            Toppings = new Dictionary<string, (int MeatID, int Amount)>(),
            Quantity = 1
        });

        Session["CurrentOrder"] = currentOrder;

        PopulateOrderItemsMenu();

        Response.Redirect(Request.RawUrl);
    }

    protected void RmvOrderItemBTN_Click(object sender, EventArgs e)
    {
        // Remove the OrderItem currently selected in the dropdown menu
        if (OrderItemSelectionDropDownMenu.SelectedItem != null)
        {
            int selectedId;
            if (int.TryParse(OrderItemSelectionDropDownMenu.SelectedValue, out selectedId))
            {
                var itemToRemove = currentOrder.OrderItems.FirstOrDefault(item => item.ID == selectedId);
                if (itemToRemove != null)
                {
                    currentOrder.OrderItems.Remove(itemToRemove);
                    Session["CurrentOrder"] = currentOrder;

                    // Update UI for this request
                    PopulateOrderItemsMenu();

                    // Reset selection to avoid attempting to remove the same id on reload
                    if (OrderItemSelectionDropDownMenu.Items.Count > 0)
                        OrderItemSelectionDropDownMenu.SelectedIndex = 0;

                    // Prevent duplicate removal when the user reloads the page (Post/Redirect/Get)
                    Response.Redirect(Request.RawUrl);
                }
            }
        }
    }

    protected void OrderItemSelectionDropDownMenu_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Fix: Compare the ListItem's Text or Value property to the string instead of the ListItem itself
        if (OrderItemSelectionDropDownMenu.SelectedItem != null &&
            OrderItemSelectionDropDownMenu.SelectedItem.Text != "choose an OrderItem")
        {
            OrderItemSelectionMultiView.ActiveViewIndex = 1;
        }
        else
        {
            OrderItemSelectionMultiView.ActiveViewIndex = 0; // No selection
        }
    }
}