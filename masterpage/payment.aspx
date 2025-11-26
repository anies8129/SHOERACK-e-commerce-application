<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="masterpage.payment" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account & Payment</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(120deg, #9be7ff 0%, #e3f2fd 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', 'Roboto', Arial, sans-serif;
        }
        .form-container {
            background: #fff;
            border-radius: 18px;
            max-width: 430px;
            margin: 58px auto;
            padding: 34px 34px 24px 34px;
            box-shadow: 0 10px 32px 5px rgba(96,180,241,0.11), 0 1.5px 14px 0 rgba(0,0,0,0.07);
            position: relative;
        }
        .form-container h2 {
            color: #0077c7;
            letter-spacing: 1px;
            font-weight: 600;
        }
        .form-control, .auto-style1 {
            padding: 12px 14px;
            border-radius: 8px;
            border: 1px solid #cbe5fe;
            transition: border-color 0.2s;
            background: #f2faff;
            font-size: 1rem;
        }
        .form-control:focus, .auto-style1:focus {
            border-color: #67b8f2;
            background: #e9f6fe;
            box-shadow: 0 0 0 2px #b6e3fd3a;
        }
        label {
            font-weight: 500;
            color: #38618a;
        }
        .btn-primary, .btn-success {
            background: linear-gradient(90deg, #009be8 60%, #77d9fe 100%);
            border: none;
            font-weight: 600;
            letter-spacing: 0.5px;
            border-radius: 7px;
            box-shadow: 0 2px 6px 0 rgba(0,155,232,0.07);
            transition: box-shadow .2s, transform .1s, background .2s;
        }
        .btn-success {
            background: linear-gradient(90deg, #27dd81 60%, #87f6cb 100%);
        }
        .btn-primary:hover, .btn-success:hover {
            background: linear-gradient(90deg, #0076ae 60%, #33bbee 100%);
            transform: translateY(-2px) scale(1.025);
        }
        .btn-success:hover {
            background: linear-gradient(90deg, #1eac66 60%, #4ed290 100%);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .text-danger, .validator, .aspNet-Field-validator {
            color: #e12d60 !important;
            margin-top: 2px;
            display: block;
        }
        .form-container .aspNet-Field-validator {
            font-size: 0.95rem;
        }
        .aspNet-Label-Success {
            color: #2dc31e !important;
            font-weight: 600;
            font-size: 1rem;
            letter-spacing: 0.5px;
        }
        @media (max-width: 500px) {
            .form-container {
                padding: 20px 7px 10px 7px;
            }
            .form-container h2 {
                font-size: 1.3rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container shadow-lg">

            <asp:Panel ID="pnlAccount" runat="server">
                <h2 class="text-center mb-4">Enter Account Details</h2>
                <div class="form-group">
                    <label for="txtAccNumber">Account Number</label>
                    <asp:TextBox ID="txtAccNumber" CssClass="auto-style1" runat="server" placeholder="Enter Account Number" AutoPostBack="True" OnTextChanged="txtAccNumber_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="txtAccNumber" ErrorMessage="Please enter your account number" CssClass="validator"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="ddlAccType">Account Type</label>
                    <asp:DropDownList ID="ddlAccType" CssClass="form-control" runat="server">
                        <asp:ListItem Value="">Select Account Type</asp:ListItem>
                        <asp:ListItem>Savings</asp:ListItem>
                        <asp:ListItem>Current</asp:ListItem>
                        <asp:ListItem>Fixed Deposit</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="ddlAccType" InitialValue="" ErrorMessage="Please select account type" CssClass="validator"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="txtBalance">Balance Amount</label>
                    <asp:TextBox ID="txtBalance" CssClass="form-control" runat="server" placeholder="Enter Balance Amount"></asp:TextBox>
                </div>
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-block"
                    Text="Submit" OnClick="btnSubmit_Click" />
                <asp:Label ID="lblError" runat="server" CssClass="validator"></asp:Label>
            </asp:Panel>

            <asp:Panel ID="pnlPayment" runat="server" Visible="false">
                <h2 class="text-center mb-4">Payment Details</h2>
                <div class="form-group">
                    <label for="txtPayAmount">Payment Amount</label>
                    <asp:TextBox ID="txtPayAmount" runat="server" CssClass="form-control" placeholder="Enter Payment Amount"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPayAmount" ErrorMessage="Please enter an amount" CssClass="validator"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="ddlPayMode">Payment Mode</label>
                    <asp:DropDownList ID="ddlPayMode" runat="server" CssClass="form-control">
                        <asp:ListItem>UPI</asp:ListItem>
                        <asp:ListItem>Net Banking</asp:ListItem>
                        <asp:ListItem>Credit Card</asp:ListItem>
                        <asp:ListItem>Debit Card</asp:ListItem>
                        <asp:ListItem>Wallet</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:Button ID="btnPay" runat="server" CssClass="btn btn-success btn-block"
                    Text="Make Payment" OnClick="btnPay_Click" />
                <asp:Label ID="lblPayStatus" runat="server" CssClass="aspNet-Label-Success"></asp:Label>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
