<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WompomPizza.Cart1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    
    <div>
        <table class="nav-justified">
        <tr>
            <td colspan="3">
                <asp:ListBox ID="lstCart" runat="server" Width="595px"></asp:ListBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Button ID="btnRemove" runat="server" Text="Remove Item" OnClick="btnRemove_Click1" />
&nbsp;<asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" OnClick="btnEmpty_Click1" />
                <br />
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                <br />
                <br />
                <br />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
                
                <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click1" PostBackUrl="~/OrderConfirmation.aspx" />
                <asp:Button ID="btnContinue" runat="server" PostBackUrl="~/Order.aspx" Text="Continue Shopping" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
        </div>
</asp:Content>