<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:MultiView ID="OrdersMultiView" runat="server" ActiveViewIndex="1">
                <asp:View ID="OrdersView" runat="server">
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="OrdersSqlDataSource" AutoGenerateSelectButton="True" DataKeyNames="OrderID" AllowPaging="True" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                                <asp:BoundField DataField="DeliveryType" HeaderText="DeliveryType" SortExpression="DeliveryType" />
                                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                                <asp:BoundField DataField="TotalAmount" HeaderText="TotalAmount" SortExpression="TotalAmount" />
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                            </Columns>
                        </asp:GridView>
                    <asp:SqlDataSource ID="OrdersSqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:OrdersDatabaseConnectionString %>' SelectCommand="SELECT * FROM [Orders]"></asp:SqlDataSource>
                </asp:View>
                <asp:View ID="OrderItemsView" runat="server">
                    <asp:Button ID="BackBTN" runat="server" Text="<" Width="115px" />
                    <asp:GridView ID="OrderDetailsView" runat="server" DataSourceID="OrderDetailsSqlDataSource" DataKeyNames="OrderItemID" AutoGenerateColumns="False" AutoGenerateSelectButton="True">
                        <Columns>
                            <asp:BoundField DataField="OrderItemID" HeaderText="OrderItemID" InsertVisible="False" ReadOnly="True" SortExpression="OrderItemID" />
                            <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID" />
                            <asp:BoundField DataField="ItemType" HeaderText="ItemType" SortExpression="ItemType" />
                            <asp:BoundField DataField="BreadID" HeaderText="BreadID" SortExpression="BreadID" />
                            <asp:CheckBoxField DataField="HasMeat" HeaderText="HasMeat" SortExpression="HasMeat" />
                            <asp:CheckBoxField DataField="HasSpreads" HeaderText="HasSpreads" SortExpression="HasSpreads" />
                            <asp:CheckBoxField DataField="HasToppings" HeaderText="HasToppings" SortExpression="HasToppings" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                            <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" ReadOnly="True" SortExpression="TotalPrice" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="OrderDetailsSqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:OrdersDatabaseConnectionString %>' SelectCommand="SELECT * FROM [Orderitems] WHERE OrderID = @OrderID">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="OrderID" PropertyName="SelectedValue" Type="Int32"/>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </asp:View>
            </asp:MultiView>
        </div>
    </form>
</body>
</html>
