using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OrderingClasses
/// </summary>
[Serializable]
public class SandWichOrder
{
    public string CustomerName { get; set; }
    public string Email { get; set; }
    public string DeliveryType { get; set; }
    public string Address { get; set; }
    //must keep an array of OrderItems, since an order can have multiple items, and each item can have different meats, spreads, and toppings
    public List<OrderItem> OrderItems { get; set; }

    public int SelectedID { get; set; }//for website purposes only, when reloading the page, to keep track of which item is selected in the dropdown menu

    public void _init_()
    {
        OrderItems = new List<OrderItem>();
    }
}
[Serializable]
public class OrderItem
{
    public int ID { get; set; }//for website purposes only
    public string ItemType { get; set; }//custom, or preset option
    //need dicts for Meats, Spreads, and Toppings, since it must contain [Meat/Spread/Topping]ID a string name, and a Quantity
    public Dictionary<string, (int MeatID, int Quantity)> Meats { get; set; }
    public Dictionary<string, (int SpreadID, int Quantity)> Spreads { get; set; }
    public Dictionary<string, (int ToppingID, int Quantity)> Toppings { get; set; }

    public int Quantity { get; set; }
}