using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            OrdersMultiView.ActiveViewIndex = 0;
        }
    }

    protected void BackBTN_Click(object sender, EventArgs e)
    {
            if (OrdersMultiView.ActiveViewIndex > 0)
            {
                OrdersMultiView.ActiveViewIndex -= 1;
            }
    }

    public void Get_OrderItems_From_Order(object sender, EventArgs e)
    {
        OrdersMultiView.ActiveViewIndex = 1;

        TestLBL.Text = "OrderID: " + OrdersGrid.SelectedRow.Cells[1].Text;

        OrderItemsGrid.DataBind();
    }
    protected void OrderItemsGrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Ingredients.DataBind();
    }
}