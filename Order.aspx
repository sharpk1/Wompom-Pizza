<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="WompomPizza.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 827px;
        }
        .auto-style2 {
        width: 494px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div>
    <table class="nav-justified">
        <tr>
            <td class="auto-style2">Select a pizza:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            <td class="auto-style4">
                <asp:DropDownList ID="ddlProduct" runat="server" DataSourceID="SqlDataSource1" DataTextField="Description" DataValueField="ProductID" Height="48px" Width="152px" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:USETHISONE %>" SelectCommand="SELECT [ProductID], [Description], [CurrentPrice], [ProductImage] FROM [Product]"></asp:SqlDataSource>
                <asp:Image ID="ProductImage" runat="server" Height="100px" Width="100px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblName" runat="server"></asp:Label>
            </td>
            <td class="auto-style1">
                <asp:Label ID="lblUnitPrice" runat="server"></asp:Label>
            </td>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblDescription" runat="server"></asp:Label>
            </td>
            <td class="auto-style4">&nbsp;Quantity:
                <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
            &nbsp;<br />
                <br />
                <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" OnClick="btnAdd_Click1" />
                <asp:Button ID="btnGoToCart" runat="server" PostBackUrl="~/Cart.aspx" Text="Go to Cart" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
        <br />
        </div>
    </asp:Content>
