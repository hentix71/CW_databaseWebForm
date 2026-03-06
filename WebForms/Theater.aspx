<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Theater.aspx.cs" Inherits="WebForm.WebForms.Theater" %>

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
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="THEATREID" DataSourceID="TheatreTable" ForeColor="Black" height="100%"  Width="100%">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="THEATREID" HeaderText="THEATREID" ReadOnly="True" SortExpression="THEATREID" />
                            <asp:BoundField DataField="THEATRENAME" HeaderText="THEATRENAME" SortExpression="THEATRENAME" />
                            <asp:BoundField DataField="THEATRECITYHALL" HeaderText="THEATRECITYHALL" SortExpression="THEATRECITYHALL" />
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
                    <asp:SqlDataSource ID="TheatreTable" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;THEATRE&quot; WHERE &quot;THEATREID&quot; = :THEATREID" InsertCommand="INSERT INTO &quot;THEATRE&quot; (&quot;THEATREID&quot;, &quot;THEATRENAME&quot;, &quot;THEATRECITYHALL&quot;) VALUES (:THEATREID, :THEATRENAME, :THEATRECITYHALL)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;THEATRE&quot;" UpdateCommand="UPDATE &quot;THEATRE&quot; SET &quot;THEATRENAME&quot; = :THEATRENAME, &quot;THEATRECITYHALL&quot; = :THEATRECITYHALL WHERE &quot;THEATREID&quot; = :THEATREID">
                        <DeleteParameters>
                            <asp:Parameter Name="THEATREID" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="THEATREID" Type="String" />
                            <asp:Parameter Name="THEATRENAME" Type="String" />
                            <asp:Parameter Name="THEATRECITYHALL" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="THEATRENAME" Type="String" />
                            <asp:Parameter Name="THEATRECITYHALL" Type="String" />
                            <asp:Parameter Name="THEATREID" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>

                <div class="Form">
                    <asp:FormView ID="FormView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="THEATREID" DataSourceID="TheatreTable" ForeColor="Black" GridLines="Both" height="100%" Width="100%" OnPageIndexChanging="FormView1_PageIndexChanging">
                        <EditItemTemplate>
                            THEATREID:
                            <asp:Label ID="THEATREIDLabel1" runat="server" Text='<%# Eval("THEATREID") %>' />
                            <br />
                            THEATRENAME:
                            <asp:TextBox ID="THEATRENAMETextBox" runat="server" Text='<%# Bind("THEATRENAME") %>' />
                            <br />
                            THEATRECITYHALL:
                            <asp:TextBox ID="THEATRECITYHALLTextBox" runat="server" Text='<%# Bind("THEATRECITYHALL") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>
                            THEATREID:
                            <asp:TextBox ID="THEATREIDTextBox" runat="server" Text='<%# Bind("THEATREID") %>' />
                            <br />
                            THEATRENAME:
                            <asp:TextBox ID="THEATRENAMETextBox" runat="server" Text='<%# Bind("THEATRENAME") %>' />
                            <br />
                            THEATRECITYHALL:
                            <asp:TextBox ID="THEATRECITYHALLTextBox" runat="server" Text='<%# Bind("THEATRECITYHALL") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            THEATREID:
                            <asp:Label ID="THEATREIDLabel" runat="server" Text='<%# Eval("THEATREID") %>' />
                            <br />
                            THEATRENAME:
                            <asp:Label ID="THEATRENAMELabel" runat="server" Text='<%# Bind("THEATRENAME") %>' />
                            <br />
                            THEATRECITYHALL:
                            <asp:Label ID="THEATRECITYHALLLabel" runat="server" Text='<%# Bind("THEATRECITYHALL") %>' />
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
                <asp:Chart ID="Chart1" runat="server" DataSourceID="TheatreTable" Width="500px">
                    <Series>
                        <asp:Series Name="Series1"></asp:Series>
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
