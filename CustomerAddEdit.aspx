<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerAddEdit.aspx.cs" Inherits="WompomPizza.CustomerAddEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 189px;
    }
    .auto-style2 {
        width: 189px;
        height: 22px;
    }
    .auto-style3 {
        height: 22px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div>
        <table class="nav-justified">
            <tr>
                <td class="auto-style2">Search for a customer:</td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style1">First Name:</td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Last Name:</td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" />
                </td>
            </tr>
        </table>
    </div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:USETHISONE %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
<br />
<asp:Label ID="lblErrorMessage" runat="server" CssClass="error-Message" EnableViewState="False"></asp:Label>
<br />
<asp:DetailsView ID="dvCustomerDetails" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="CustomerID" DataSourceID="sdsCustomerDetails" ForeColor="#333333" GridLines="None" Height="50px" OnItemDeleted="dvCustomerDetails_ItemDeleted" OnItemInserted="dvCustomerDetails_ItemInserted" OnItemUpdated="dvCustomerDetails_ItemUpdated" Width="440px">
    <AlternatingRowStyle BackColor="White" />
    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
    <EditRowStyle BackColor="#2461BF" />
    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
    <Fields>
        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
        <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName" />
        <asp:BoundField DataField="LName" HeaderText="LName" SortExpression="LName" />
        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
    </Fields>
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
</asp:DetailsView>
<asp:SqlDataSource ID="sdsCustomerDetails" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:USETHISONE %>" DeleteCommand="DELETE FROM [Customer] WHERE [CustomerID] = @original_CustomerID AND [FName] = @original_FName AND [LName] = @original_LName AND [Address] = @original_Address AND [Phone] = @original_Phone" InsertCommand="INSERT INTO [Customer] ([FName], [LName], [Address], [Phone]) VALUES (@FName, @LName, @Address, @Phone)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [CustomerID], [FName], [LName], [Address], [Phone] FROM [Customer]" UpdateCommand="UPDATE [Customer] SET [FName] = @FName, [LName] = @LName, [Address] = @Address, [Phone] = @Phone WHERE [CustomerID] = @original_CustomerID AND [FName] = @original_FName AND [LName] = @original_LName AND [Address] = @original_Address AND [Phone] = @original_Phone">
    <DeleteParameters>
        <asp:Parameter Name="original_CustomerID" Type="Int32" />
        <asp:Parameter Name="original_FName" Type="String" />
        <asp:Parameter Name="original_LName" Type="String" />
        <asp:Parameter Name="original_Address" Type="String" />
        <asp:Parameter Name="original_Phone" Type="Int64" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="FName" Type="String" />
        <asp:Parameter Name="LName" Type="String" />
        <asp:Parameter Name="Address" Type="String" />
        <asp:Parameter Name="Phone" Type="Int64" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="FName" Type="String" />
        <asp:Parameter Name="LName" Type="String" />
        <asp:Parameter Name="Address" Type="String" />
        <asp:Parameter Name="Phone" Type="Int64" />
        <asp:Parameter Name="original_CustomerID" Type="Int32" />
        <asp:Parameter Name="original_FName" Type="String" />
        <asp:Parameter Name="original_LName" Type="String" />
        <asp:Parameter Name="original_Address" Type="String" />
        <asp:Parameter Name="original_Phone" Type="Int64" />
    </UpdateParameters>
</asp:SqlDataSource>
    <br />
</asp:Content>
