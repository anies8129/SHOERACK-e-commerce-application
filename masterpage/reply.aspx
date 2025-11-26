<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reply.aspx.cs" Inherits="masterpage.reply" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Send Email</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
      .email-form-container { max-width: 500px; margin: 40px auto; padding: 30px 28px; background: #fafdff; border-radius: 12px; box-shadow: 0 4px 20px rgba(40,43,53,0.10);}
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <div class="email-form-container">
        <h3 class="text-center mb-4">Send Email</h3>
        <div class="form-group">
            <label for="txtTo">To</label>
            <asp:TextBox ID="txtTo" runat="server" CssClass="form-control" placeholder="Recipient email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvTo" runat="server"
              ControlToValidate="txtTo" ErrorMessage="Please enter recipient's email" Display="Dynamic" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="txtFrom">From</label>
            <asp:TextBox ID="txtFrom" runat="server" CssClass="form-control" placeholder="Your email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFrom" runat="server"
              ControlToValidate="txtFrom" ErrorMessage="Please enter your email" Display="Dynamic" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="txtSubject">Subject</label>
            <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Email subject"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvSubject" runat="server"
              ControlToValidate="txtSubject" ErrorMessage="Please enter subject" Display="Dynamic" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="txtBody">Body</label>
            <asp:TextBox ID="txtBody" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="6" placeholder="Type your message"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBody" runat="server"
              ControlToValidate="txtBody" ErrorMessage="Please enter message" Display="Dynamic" ForeColor="Red" />
        </div>
        <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary btn-block" 
            Text="Send Email" OnClick="btnSend_Click" />
        <asp:Label ID="lblResult" runat="server" CssClass="d-block mt-3 text-center" />
      </div>
    </form>
</body>
</html>
