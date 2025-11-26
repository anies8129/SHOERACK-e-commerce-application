<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="masterpage.feedback1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Feedback Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #2b7a78;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        asp\:TextBox, asp\:Label {
            display: block;
            width: 100%;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        textarea {
            height: 100px;
            resize: none;
        }

        .btn {
            background-color: #2b7a78;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            font-weight: bold;
            font-size: 15px;
        }

        .btn:hover {
            background-color: #256d6a;
        }

        .result {
            margin-top: 20px;
            background: #f8fafc;
            border: 1px dashed #ccc;
            border-radius: 8px;
            padding: 10px;
        }

        .result label {
            font-weight: bold;
            color: #333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Feedback Form</h2>

            <div class="form-group">
                &nbsp;<label for="txtFeedback">Feedback</label>
                <asp:TextBox ID="txtFeedback" runat="server" TextMode="MultiLine" placeholder="Enter your feedback here..."></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" ForeColor="Lime" Text="Successfully Inserted" Visible="False"></asp:Label>
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit Feedback" CssClass="btn" OnClick="btnSubmit_Click" />

        </div>
    </form>
</body>
</html>
