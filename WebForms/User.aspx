<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="WebForm.User" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <style>
        html{
            height:100%;
            width:100%;
        }
        body, form{
            height:100%;
            width:100%;
        }
        .main {
            display: flex;
            gap: 20px;
            height:100%;
            width:100%;
            
        }

        .left {
            display: flex;
            flex-direction: column;
            width: 60%;
            gap: 10px;
            color:aqua;
            height:100%;
            border:2px solid black;
            }

        .Graph {
            width: 40%;
            height:100%;
            color:darkred;
            border:2px solid black;
        }

        .Grid, .Form {
            width:100%;
            border: 1px solid #ccc;
            padding: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">

            <div class="left">
                
                <div class="Grid">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="USERID" DataSourceID="UserTable" height="100%"  Width="100%" AllowSorting="True" GridLines="Horizontal">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="USERID" HeaderText="USERID" ReadOnly="True" SortExpression="USERID" />
                            <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                            <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
                            <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" SortExpression="Phone_Number" />
                        </Columns>
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <SortedAscendingCellStyle BackColor="#F4F4FD" />
                        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                        <SortedDescendingCellStyle BackColor="#D8D8F0" />
                        <SortedDescendingHeaderStyle BackColor="#3E3277" />
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
                    <asp:SqlDataSource ID="MovieTable" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;User&quot;">
                    </asp:SqlDataSource>
                </div>

                <div class="Form">
                    <asp:FormView ID="FormView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="USERID" DataSourceID="UserTable" ForeColor="Black" GridLines="Both" height="100%" Width="100%">
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
                        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
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
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                    </asp:FormView>
                </div>
 
            </div>
            
            <div class="Graph">
                <asp:Chart ID="Chart1" runat="server" DataSourceID="UserTable" Width="500px">
                    <Series>
                        <asp:Series Name="Series1" ChartType="Bar" XValueMember="ADDRESS" YValueMembers="USERID"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>

        </div>
    </form>
</body>
</html>
