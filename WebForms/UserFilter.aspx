<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserFilter.aspx.cs" Inherits="WebForm.WebForms.User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="UserDrop" DataTextField="USERNAME" DataValueField="USERNAME">
            <asp:ListItem>All Users</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="UserDrop" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;User&quot;"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowCustomPaging="True" AutoGenerateColumns="False" DataKeyNames="USERID" DataSourceID="UserGrid">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="USERID" HeaderText="USERID" ReadOnly="True" SortExpression="USERID" />
                <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
                <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" SortExpression="Phone_Number" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="UserGrid" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;User&quot; WHERE &quot;USERID&quot; = :USERID" InsertCommand="INSERT INTO &quot;User&quot; (&quot;USERID&quot;, &quot;USERNAME&quot;, &quot;ADDRESS&quot;, &quot;Phone_Number&quot;) VALUES (:USERID, :USERNAME, :ADDRESS, :Phone_Number)" OnSelecting="UserGrid_Selecting" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;User&quot; WHERE ( :USERNAME = 'All Users' OR &quot;USERNAME&quot; = :USERNAME )" UpdateCommand="UPDATE &quot;User&quot; SET &quot;USERNAME&quot; = :USERNAME, &quot;ADDRESS&quot; = :ADDRESS, &quot;Phone_Number&quot; = :Phone_Number WHERE &quot;USERID&quot; = :USERID">
            <DeleteParameters>
                <asp:Parameter Name="USERID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USERID" Type="Decimal" />
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="Phone_Number" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="All Users" Name="USERNAME" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="Phone_Number" Type="Decimal" />
                <asp:Parameter Name="USERID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="USERID" DataSourceID="UserTable">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="USERID" HeaderText="USERID" ReadOnly="True" SortExpression="USERID" />
                <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
                <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" SortExpression="Phone_Number" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="UserTable" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;User&quot; WHERE &quot;USERID&quot; = :USERID" InsertCommand="INSERT INTO &quot;User&quot; (&quot;USERID&quot;, &quot;USERNAME&quot;, &quot;ADDRESS&quot;, &quot;Phone_Number&quot;) VALUES (:USERID, :USERNAME, :ADDRESS, :Phone_Number)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;User&quot;" UpdateCommand="UPDATE &quot;User&quot; SET &quot;USERNAME&quot; = :USERNAME, &quot;ADDRESS&quot; = :ADDRESS, &quot;Phone_Number&quot; = :Phone_Number WHERE &quot;USERID&quot; = :USERID">
            <DeleteParameters>
                <asp:Parameter Name="USERID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USERID" Type="Decimal" />
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="Phone_Number" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="Phone_Number" Type="Decimal" />
                <asp:Parameter Name="USERID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="USERID" DataSourceID="UserTable">
            <EditItemTemplate>
                USERID:
                <asp:Label ID="USERIDLabel1" runat="server" Text='<%# Eval("USERID") %>' />
                <br />
                USERNAME:
                <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' />
                <br />
                ADDRESS:
                <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
                <br />
                Phone_Number:
                <asp:TextBox ID="Phone_NumberTextBox" runat="server" Text='<%# Bind("Phone_Number") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                USERID:
                <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' />
                <br />
                USERNAME:
                <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' />
                <br />
                ADDRESS:
                <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
                <br />
                Phone_Number:
                <asp:TextBox ID="Phone_NumberTextBox" runat="server" Text='<%# Bind("Phone_Number") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                USERID:
                <asp:Label ID="USERIDLabel" runat="server" Text='<%# Eval("USERID") %>' />
                <br />
                USERNAME:
                <asp:Label ID="USERNAMELabel" runat="server" Text='<%# Bind("USERNAME") %>' />
                <br />
                ADDRESS:
                <asp:Label ID="ADDRESSLabel" runat="server" Text='<%# Bind("ADDRESS") %>' />
                <br />
                Phone_Number:
                <asp:Label ID="Phone_NumberLabel" runat="server" Text='<%# Bind("Phone_Number") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>
