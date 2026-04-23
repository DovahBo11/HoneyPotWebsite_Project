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

    }
    protected void BackButton_Click(object sender, EventArgs e)
    {
            if (OrdersMultiView.ActiveViewIndex > 0)
            {
                OrdersMultiView.ActiveViewIndex = 0;
            }
    }
}