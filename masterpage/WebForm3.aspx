<%@ Page Title="" Language="C#" MasterPageFile="~/product.Master" AutoEventWireup="true"  CodeBehind="WebForm3.aspx.cs" Inherits="masterpage.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .product-detail {
            margin: 20px;
        }
        .product-image {
            width: 300px;
            height: 300px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
        }
        .product-label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
        }
        .quantity-textbox {
            width: 50px;
        }
        .btn {
            margin-top: 15px;
            margin-right: 10px;
            padding: 8px 15px;
            font-weight: bold;
            cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-detail">
        <asp:Image ID="image1" runat="server" CssClass="product-image" ImageUrl="~/images/sample_product.jpg" AlternateText="Product Image" />
        
        <asp:Label ID="label1" runat="server" CssClass="product-label" Text="Product Name: Stylish Shoe"></asp:Label>
        <asp:Label ID="label2" runat="server" CssClass="product-label" Text="Pieces Available: 10"></asp:Label>
        <asp:Label ID="label3" runat="server" CssClass="product-label" Text="Enter Quantity:"></asp:Label>
        <asp:TextBox ID="txtQuantity" runat="server" CssClass="quantity-textbox" Text="1"></asp:TextBox>
        
        &nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="+" />
&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="-" />
        
        <br />
        
        <asp:Button ID="btnAddToCart" runat="server" CssClass="btn" Text="Add to Cart" OnClick="btnAddToCart_Click" />
        <asp:Button ID="btnContinueShopping" runat="server" CssClass="btn" Text="Continue Shopping" OnClick="btnContinueShopping_Click" />
    </div>
    <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
</asp:Content>