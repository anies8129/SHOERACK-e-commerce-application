<%@ Page Title="" Language="C#" MasterPageFile="~/reglogin.Master" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="masterpage.addproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .form-box {
          background: #fff;
          border-radius: 24px;
          box-shadow: 0 8px 32px rgba(60,40,46,0.20);
          padding: 38px 44px 32px 44px;
          max-width: 460px;
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
          margin-bottom: 20px;
          position: relative;
        }
        .form-field label {
          font-size: 15px;
          color: #666;
          margin-bottom: 6px;
          display: block;
          font-weight: 500;
        }
        .form-field input,
        .form-field select,
        .form-field textarea {
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
        .form-field input:focus,
        .form-field select:focus,
        .form-field textarea:focus {
          border-color: #21243d;
        }
        .form-field select {
          background: #fafafb url('data:image/svg+xml;utf8,<svg fill="gray" height="18" viewBox="0 0 24 24" width="18" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/></svg>') no-repeat right 16px center/18px 18px;
          appearance: none;
        }
        .submit-btn {
          width: 100%;
          background: linear-gradient(90deg, #ffaf00, #a77fff 100%);
          color: #fff;
          border: none;
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
        .submit-btn:hover {
          background: linear-gradient(90deg, #21243d, #ffaf00 100%);
        }
        .brand-note {
          text-align: center;
          font-size: 14px;
          color: #888;
          margin-top: 18px;
          letter-spacing: 1px;
        }
        .auto-style2:hover {
    background: linear-gradient(90deg, #000000, #000000 100%);
    color: #fff; /* White text on hover for contrast */
}
    </style>
    <div class="form-box">
        &nbsp;<h2>ADD PRODUCTS</h2>
        <div class="form-field">
            <label>Product name</label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
             <div class="form-field">
                  <label>Category Name</label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" >
            </asp:DropDownList>
            <label>Product Image</label>
            <asp:FileUpload ID="FileUpload1" runat="server" />
                  <label>Product Discription</label>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                  <label>Product Price</label>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                 <label>Product Stock</label>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                  <asp:Button ID="btnRegister" runat="server" CssClass="auto-style2" Text="Add" OnClick="btnRegister_Click"   />
             <div class="form-field">
                 <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
</asp:Content>
