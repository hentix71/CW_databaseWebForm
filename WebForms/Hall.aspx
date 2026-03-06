<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hall.aspx.cs" Inherits="WebForm.WebForms.Hall" %>

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
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="HALLID" DataSourceID="HallTable" ForeColor="Black" height="100%"  Width="100%">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="HALLID" HeaderText="HALLID" ReadOnly="True" SortExpression="HALLID" />
                            <asp:BoundField DataField="HALLNAME" HeaderText="HALLNAME" SortExpression="HALLNAME" />
                            <asp:BoundField DataField="HALLCAPACITY" HeaderText="HALLCAPACITY" SortExpression="HALLCAPACITY" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="HallTable" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;HALL&quot; WHERE &quot;HALLID&quot; = :HALLID" InsertCommand="INSERT INTO &quot;HALL&quot; (&quot;HALLID&quot;, &quot;HALLNAME&quot;, &quot;HALLCAPACITY&quot;) VALUES (:HALLID, :HALLNAME, :HALLCAPACITY)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;HALL&quot;" UpdateCommand="UPDATE &quot;HALL&quot; SET &quot;HALLNAME&quot; = :HALLNAME, &quot;HALLCAPACITY&quot; = :HALLCAPACITY WHERE &quot;HALLID&quot; = :HALLID">
                        <DeleteParameters>
                            <asp:Parameter Name="HALLID" Type="Decimal" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="HALLID" Type="Decimal" />
                            <asp:Parameter Name="HALLNAME" Type="String" />
                            <asp:Parameter Name="HALLCAPACITY" Type="Decimal" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="HALLNAME" Type="String" />
                            <asp:Parameter Name="HALLCAPACITY" Type="Decimal" />
                            <asp:Parameter Name="HALLID" Type="Decimal" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>

                <div class="Form">
                    <asp:FormView ID="FormView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="HALLID" DataSourceID="HallTable" ForeColor="Black" GridLines="Both" height="100%" Width="100%">
                        <EditItemTemplate>
                            HALLID:
                            <asp:Label ID="HALLIDLabel1" runat="server" Text='<%# Eval("HALLID") %>' />
                            <br />
                            HALLNAME:
                            <asp:TextBox ID="HALLNAMETextBox" runat="server" Text='<%# Bind("HALLNAME") %>' />
                            <br />
                            HALLCAPACITY:
                            <asp:TextBox ID="HALLCAPACITYTextBox" runat="server" Text='<%# Bind("HALLCAPACITY") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>
                            HALLID:
                            <asp:TextBox ID="HALLIDTextBox" runat="server" Text='<%# Bind("HALLID") %>' />
                            <br />
                            HALLNAME:
                            <asp:TextBox ID="HALLNAMETextBox" runat="server" Text='<%# Bind("HALLNAME") %>' />
                            <br />
                            HALLCAPACITY:
                            <asp:TextBox ID="HALLCAPACITYTextBox" runat="server" Text='<%# Bind("HALLCAPACITY") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            HALLID:
                            <asp:Label ID="HALLIDLabel" runat="server" Text='<%# Eval("HALLID") %>' />
                            <br />
                            HALLNAME:
                            <asp:Label ID="HALLNAMELabel" runat="server" Text='<%# Bind("HALLNAME") %>' />
                            <br />
                            HALLCAPACITY:
                            <asp:Label ID="HALLCAPACITYLabel" runat="server" Text='<%# Bind("HALLCAPACITY") %>' />
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
                <asp:Chart ID="Chart1" runat="server" DataSourceID="HallTable" Width="500px">
                    <Series>
                        <asp:Series Name="Series1" ChartType="Point" XValueMember="HALLNAME" YValueMembers="HALLCAPACITY"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>

        </div>
    </form>
</body>
</html>
