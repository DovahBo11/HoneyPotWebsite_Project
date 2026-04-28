<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Menu ID="NavigationMenu" renderingmode="Table" CssClass="NagivagionMenu" runat="server" Orientation="Horizontal" BackColor="White">
                <Items>
                    <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/HomePage.aspx"/>
                    <asp:MenuItem Text="|" Enabled="false" Selectable="false" />
                    <asp:MenuItem Text="Place an Order" Value="Order" NavigateUrl="~/OrderingPage.aspx" />
                    <asp:MenuItem Text="|" Enabled="false" Selectable="false" />
                    <asp:MenuItem Text="About Us" Value="ContactUs" NavigateUrl="~/AboutUsPage.aspx" />
                </Items>
            </asp:Menu>
            <asp:MultiView ID="OrdersMultiView" runat="server" ActiveViewIndex="0">
                <asp:View ID="OrdersView" runat="server">
                    <asp:GridView ID="OrdersGrid" runat="server" DataSourceID="OrdersSqlDataSource" AutoGenerateSelectButton="True" DataKeyNames="OrderID" AllowPaging="True" AutoGenerateColumns="False"  OnSelectedIndexChanged="Get_OrderItems_From_Order">
                            <Columns>
                                <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                                <asp:BoundField DataField="DeliveryType" HeaderText="DeliveryType" SortExpression="DeliveryType" />
                                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                                <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" SortExpression="TotalPrice" />
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                            </Columns>
                        </asp:GridView>
                    <asp:SqlDataSource ID="OrdersSqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:OrdersDatabaseConnectionString %>' SelectCommand="SELECT * FROM [Orders]"></asp:SqlDataSource>
                </asp:View>
                <asp:View ID="OrderItemsView" runat="server">
                    <asp:Label ID="TestLBL" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Button ID="BackBTN1" runat="server" Text="<" Width="115px" OnClick="BackBTN_Click" />
                    <asp:GridView ID="OrderItemsGrid" runat="server" DataSourceID="OrderDetailsSqlDataSource" DataKeyNames="OrderItemID" AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanged="OrderItemsGrid_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="OrderItemID" HeaderText="OrderItemID" InsertVisible="False" ReadOnly="True" SortExpression="OrderItemID" />
                            <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID" />
                            <asp:BoundField DataField="ItemType" HeaderText="ItemType" SortExpression="ItemType" />
                            <asp:BoundField DataField="BreadID" HeaderText="BreadID" SortExpression="BreadID" />
                            <asp:CheckBoxField DataField="HasMeats" HeaderText="HasMeats" SortExpression="HasMeats" />
                            <asp:CheckBoxField DataField="HasSpreads" HeaderText="HasSpreads" SortExpression="HasSpreads" />
                            <asp:CheckBoxField DataField="HasToppings" HeaderText="HasToppings" SortExpression="HasToppings" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                            <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" ReadOnly="True" SortExpression="TotalPrice" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="OrderDetailsSqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:OrdersDatabaseConnectionString %>' SelectCommand="SELECT * FROM [OrderItems] WHERE OrderID = @OrderID" CancelSelectOnNullParameter="False">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="OrdersGrid" Name="OrderID" PropertyName="SelectedValue" Type="Int32"/>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DetailsView ID="Ingredients" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="IngredientsSqlDataSource">
                        <Fields>
                            <asp:BoundField DataField="OrderItemID" HeaderText="OrderItemID" SortExpression="OrderItemID" ReadOnly="True" />
                            <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" ReadOnly="True" />
                            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" ReadOnly="True" />
                        </Fields>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="IngredientsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OrdersDatabaseConnectionString %>" SelectCommand="ups_GetOrderItemIngredients" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="OrderItemsGrid" Name="OrderItemID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <%-- view is used to display the names of the bread, meat, spreads, and toppings instead of just their IDs and boolean values. --%> 
                    <asp:Label ID="BreadLBL" runat="server" Text="Bread: "></asp:Label>
                    <br />
                    <%-- displays a list of all meat records associated with the selected order item. This is done by querying the OrderItemMeats table for records that match the selected OrderItemID, and then joining those records with the Meats table to retrieve the names of the meats. --%>
                    <%-- Meats(s): MeatName(Amount) --%>
                    <asp:Label ID="MeatLBL" runat="server" Text="Meat(s): "></asp:Label>
                    <br />
                    <%-- displays a list of all spread records associated with the selected order item. This is done by querying the OrderItemSpreads table for records that match the selected OrderItemID, and then joining those records with the Spreads table to retrieve the names of the spreads. --%>
                    <%-- Spread(s): SpreadName(Amount) --%>
                    <asp:Label ID="SpreadsLBL" runat="server" Text="Spread(s): "></asp:Label>
                    <br />
                    <%-- displays a list of all topping records associated with the selected order item. This is done by querying the OrderItemToppings table for records that match the selected OrderItemID, and then joining those records with the Toppings table to retrieve the names of the toppings. --%>
                    <%-- Topping(s): ToppingName(Amount) --%>
                    <asp:Label ID="ToppingsLBL" runat="server" Text="Topping(s): "></asp:Label>
                
                </asp:View>
            </asp:MultiView>
        </div>
    </form>
</body>
</html>
