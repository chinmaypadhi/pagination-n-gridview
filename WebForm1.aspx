<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="pagination_n_gridview.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server"  OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="True" PageSize="1">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:curigmaConnectionString %>" SelectCommand="SELECT * FROM [employee]"></asp:SqlDataSource>
    </form>
</body>
</html>
