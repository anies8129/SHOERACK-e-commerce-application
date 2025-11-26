<%@ Page Title="" Language="C#" MasterPageFile="~/reglogin.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="masterpage.login1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <style>
        .form-box {
            background: #fff;
            border-radius: 24px;
            box-shadow: 0 8px 32px rgba(60,40,46,0.20);
            padding: 38px 44px 32px 44px;
            max-width: 380px;
            width: 96vw;
            position: relative;
            margin: 40px auto;
        }
        .shoe-img {
            width: 55px;
            height: 55px;
            position: absolute;
            top: -28px;
            left: 50%;
            transform: translateX(-50%);
            border-radius: 50%;
            background: #ffc107;
            padding: 8px;
            box-shadow: 0 2px 6px rgba(33,33,33,0.2);
        }
        .form-box h2 {
            text-align: center;
            margin-top: 30px;
            margin-bottom: 18px;
            letter-spacing: 1.5px;
            color: #1a223e;
            font-weight: 700;
        }
        .form-field {
            margin-bottom: 24px;
            position: relative;
        }
        .form-field label {
            font-size: 15px;
            color: #666;
            margin-bottom: 6px;
            display: block;
            font-weight: 500;
        }
        .form-field input {
            width: 100%;
            border: 1.5px solid #e1e1e1;
            border-radius: 10px;
            padding: 12px 14px;
            font-size: 16px;
            transition: border 0.2s;
            background: #fafafb;
            color: #222;
            outline: none;
        }
        .form-field input:focus {
            border-color: #21243d;
        }
        .auto-style2 {
            border-style: none;
            width: 100%;
            background: linear-gradient(90deg, #21243d, #ffaf00 100%);
            color: #fff;
            border-radius: 10px;
            padding: 14px;
            font-size: 20px;
            font-weight: 600;
            letter-spacing: 2px;
            margin-top: 8px;
            cursor: pointer;
            box-shadow: 0 4px 18px rgba(60,40,46,0.08);
            transition: background 0.2s;
        }
        .auto-style2:hover {
            background: linear-gradient(90deg, #ffaf00, #a77fff 100%);
        }
        .brand-note {
            text-align: center;
            font-size: 14px;
            color: #888;
            margin-top: 18px;
            letter-spacing: 1px;
        }
        .forgot-link {
            text-align: right; 
            margin-bottom: 14px; 
        }
        .forgot-link a {
            font-size: 13px; 
            color: #21243d; 
            text-decoration: underline;
        }

    </style>
    <div class="form-box">
        &nbsp;<h2>ShoeMart Login</h2>
        <div class="form-field">
            <label>Username</label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
        <div class="form-field">
            <label>Password</label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </div>
        <div class="forgot-link">
            <a href="forgotpassword.aspx">Forgot password?</a>
        </div>
        <asp:Button ID="btnLogin" runat="server" CssClass="auto-style2" Text="Login" OnClick="btnLogin_Click" />
        <div class="brand-note">Step into Style. Welcome Back!</div>
    </div>

</asp:Content>