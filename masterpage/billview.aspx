<%@ Page Title="" Language="C#" MasterPageFile="~/product.Master" AutoEventWireup="true" CodeBehind="billview.aspx.cs" Inherits="masterpage.billview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background: #fafbfc;
        }
        .bill-container {
            max-width: 700px;
            margin: 40px auto;
            box-shadow: 0 10px 24px 0 rgba(60,72,88,.1);
            border-radius: 14px;
            padding: 40px 32px 32px 32px;
            background: #fff;
            border: 1px solid #e3e8ee;
        }
        .bill-header {
            text-align: center;
            margin-bottom: 36px;
        }
        .bill-header h2 {
            color: #4f46e5;
            letter-spacing: 1.5px;
            margin-bottom: 10px;
            font-size: 2.1rem;
            font-weight: 700;
        }
        .bill-table {
            width: 100%;
            border-collapse: collapse;
            margin: 16px 0 24px 0;
        }
        .bill-table th {
            background: #f3f4f6;
            color: #475569;
            font-weight: 600;
            border: none;
            padding: 12px 10px;
        }
        .bill-table td {
            border-bottom: 1.5px solid #e3e7ed;
            padding: 12px 10px;
            color: #374151;
            background: #fff;
            vertical-align: middle;
        }
        .total-row td {
            background: #f3f6fd;
            color: #3738fd;
            font-weight: 700;
            border: none;
            font-size: 1.14rem;
        }
        .customer-info {
            background: #f9fafb;
            border-left: 3px solid #6366f1;
            padding: 16px 20px;
            border-radius: 6px;
            margin-bottom: 28px;
            font-size: 1rem;
        }
        .customer-info h4 {
            margin-top: 0;
            color: #6366f1;
            margin-bottom: 10px;
            font-size: 1.13rem;
        }
        .customer-info p {
            margin: 6px 0;
            color: #475569;
        }
        .btn.btn-primary {
            color: #fff;
            background: linear-gradient(90deg,#6366f1,#3730a3);
            border: none;
            border-radius: 3px;
            padding: 11px 30px;
            font-size: 1.09em;
            font-weight: 600;
            box-shadow: 0 3px 10px 0 #7676f12a;
            transition: background 0.2s;
        }
        .btn.btn-primary:hover {
            background: #3730a3;
        }
        @media print {
            body, .bill-container {
                background: #fff;
                box-shadow: none;
                border: none;
            }
            .btn {
                display: none !important;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bill-container">
        <div class="bill-header">
            <h2>ShoeMart Invoice</h2>
            <asp:Label ID="lblOrderDate" runat="server" Text=""></asp:Label>
        </div>

        <div class="customer-info">
            <h4>Customer Details</h4>
            <p><strong>Name:</strong> <asp:Label ID="lblCustomerName" runat="server" /></p>
            <p><strong>Email:</strong> <asp:Label ID="lblCustomerEmail" runat="server" /></p>
            <p><strong>Address:</strong> <asp:Label ID="lblCustomerAddress" runat="server" /></p>
            <p><strong>Phone:</strong> <asp:Label ID="lblCustomerphone" runat="server" /></p>
        </div>

        <h4 style="color:#4f46e5; margin-top:16px;">Order Details</h4>
        <asp:GridView ID="gridview1" runat="server" AutoGenerateColumns="False" CssClass="bill-table">
            <Columns>
                <asp:BoundField DataField="product_name" HeaderText="Product Name" />
                <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="Price" HeaderText="Unit Price" />
                <asp:BoundField DataField="subtotal" HeaderText="Total" />
            </Columns>
        </asp:GridView>

        <table style="width:100%; margin-top:22px;">
            <tr class="total-row">
                <td style="text-align:right; border:none;">Grand Total:</td>
                <td style="width:180px;text-align:center; border:none;">
                    <asp:Label ID="lblGrandTotal" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>

        <div style="text-align:center; margin-top:30px;">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Proceed Payment" />
        </div>
    </div>
</asp:Content>