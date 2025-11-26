<%@ Page Title="" Language="C#" MasterPageFile="~/product.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="masterpage.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Page-specific styles, if not in master already -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="style.css" />
    <style type="text/css">
        .auto-style1 {
            left: 0;
            right: 0;
            top: 0;
            height: 47px;
        }
        .GridViewStyle td, .GridViewStyle th {
            border: 1px solid #ccc;
        }
        .GridViewStyle {
            border-collapse: collapse;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Optional header/nav bar: Usually this is in the master page, so can be omitted here -->

    <br /><br />

    <asp:GridView ID="GridView1" runat="server" Height="243px" Width="1030px"
        CssClass="GridViewStyle"
        GridLines="None" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="cart_id" ForeColor="#333333"
        OnRowCancelingEdit="GridView1_RowCancelingEdit"
        OnRowDeleting="GridView1_RowDeleting"
        OnRowEditing="GridView1_RowEditing"
        OnRowUpdating="GridView1_RowUpdating">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="product_name" HeaderText="Product Name" />
            <asp:BoundField DataField="price" HeaderText="Product Price" />
            <asp:ImageField DataImageUrlField="product_photo" HeaderText="Product Image">
                <ControlStyle Height="150px" Width="150px" />
            </asp:ImageField>
            <asp:BoundField DataField="quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="subtotal" HeaderText="SubTotal" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

    <br /><br />

    <asp:Label ID="Label1" runat="server" CssClass="fa-2x" Text="Grand Total:" />
    <asp:Label ID="Label2" runat="server" CssClass="fa-2x" Text="₹" Visible="False" />
    <asp:Label ID="Label3" runat="server" CssClass="fa-2x" Text="Label" Visible="False" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" CssClass="fa-2x" Height="27px"
        OnClick="Button1_Click" Text="Confirm booking" />
    <asp:Label ID="Label4" runat="server" Text="Label" Visible="False" />
</asp:Content>
