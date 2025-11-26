<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewfeedback.aspx.cs" Inherits="masterpage.viewfeedback" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Feedbacks</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        .grid-container { max-width:700px; margin:40px auto; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="grid-container">
            <h2 class="text-center mb-4">User Feedbacks</h2>
            <asp:GridView ID="gridview1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="review_id">
                <Columns>
                    <asp:BoundField DataField="name" HeaderText="Username" />
                    <asp:BoundField DataField="review" HeaderText="Feedback" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("review_id") %>' OnCommand="LinkButton1_Command1" >reply</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
