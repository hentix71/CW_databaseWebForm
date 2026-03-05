<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ticket.aspx.cs" Inherits="WebForm.Ticket" %>

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
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="TICKETID" DataSourceID="TicketTable" ForeColor="Black" height="100%"  Width="100%">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="TICKETID" HeaderText="TICKETID" ReadOnly="True" SortExpression="TICKETID" />
                            <asp:BoundField DataField="SEATNUMBER" HeaderText="SEATNUMBER" SortExpression="SEATNUMBER" />
                            <asp:BoundField DataField="TICKETSTATUS" HeaderText="TICKETSTATUS" SortExpression="TICKETSTATUS" />
                            <asp:BoundField DataField="TICKETPURCHASEDATE" HeaderText="TICKETPURCHASEDATE" SortExpression="TICKETPURCHASEDATE" />
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
                    <asp:SqlDataSource ID="TicketTable" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TICKET&quot; WHERE &quot;TICKETID&quot; = :TICKETID" InsertCommand="INSERT INTO &quot;TICKET&quot; (&quot;TICKETID&quot;, &quot;SEATNUMBER&quot;, &quot;TICKETSTATUS&quot;, &quot;TICKETPURCHASEDATE&quot;) VALUES (:TICKETID, :SEATNUMBER, :TICKETSTATUS, :TICKETPURCHASEDATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TICKET&quot;" UpdateCommand="UPDATE &quot;TICKET&quot; SET &quot;SEATNUMBER&quot; = :SEATNUMBER, &quot;TICKETSTATUS&quot; = :TICKETSTATUS, &quot;TICKETPURCHASEDATE&quot; = :TICKETPURCHASEDATE WHERE &quot;TICKETID&quot; = :TICKETID">
                        <DeleteParameters>
                            <asp:Parameter Name="TICKETID" Type="Decimal" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="TICKETID" Type="Decimal" />
                            <asp:Parameter Name="SEATNUMBER" Type="Decimal" />
                            <asp:Parameter Name="TICKETSTATUS" Type="String" />
                            <asp:Parameter Name="TICKETPURCHASEDATE" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SEATNUMBER" Type="Decimal" />
                            <asp:Parameter Name="TICKETSTATUS" Type="String" />
                            <asp:Parameter Name="TICKETPURCHASEDATE" Type="DateTime" />
                            <asp:Parameter Name="TICKETID" Type="Decimal" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="MovieTable" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MOVIE&quot; WHERE &quot;MOVIEID&quot; = :MOVIEID" InsertCommand="INSERT INTO &quot;MOVIE&quot; (&quot;MOVIEID&quot;, &quot;MOVIETITLE&quot;, &quot;MOVIEDURATION&quot;, &quot;MOVIELANGUAGE&quot;, &quot;MOVIEGENRE&quot;, &quot;RELEASEDATE&quot;) VALUES (:MOVIEID, :MOVIETITLE, :MOVIEDURATION, :MOVIELANGUAGE, :MOVIEGENRE, :RELEASEDATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;MOVIE&quot;" UpdateCommand="UPDATE &quot;MOVIE&quot; SET &quot;MOVIETITLE&quot; = :MOVIETITLE, &quot;MOVIEDURATION&quot; = :MOVIEDURATION, &quot;MOVIELANGUAGE&quot; = :MOVIELANGUAGE, &quot;MOVIEGENRE&quot; = :MOVIEGENRE, &quot;RELEASEDATE&quot; = :RELEASEDATE WHERE &quot;MOVIEID&quot; = :MOVIEID">
                        <DeleteParameters>
                            <asp:Parameter Name="MOVIEID" Type="Decimal" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="MOVIEID" Type="Decimal" />
                            <asp:Parameter Name="MOVIETITLE" Type="String" />
                            <asp:Parameter Name="MOVIEDURATION" Type="String" />
                            <asp:Parameter Name="MOVIELANGUAGE" Type="String" />
                            <asp:Parameter Name="MOVIEGENRE" Type="String" />
                            <asp:Parameter Name="RELEASEDATE" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="MOVIETITLE" Type="String" />
                            <asp:Parameter Name="MOVIEDURATION" Type="String" />
                            <asp:Parameter Name="MOVIELANGUAGE" Type="String" />
                            <asp:Parameter Name="MOVIEGENRE" Type="String" />
                            <asp:Parameter Name="RELEASEDATE" Type="DateTime" />
                            <asp:Parameter Name="MOVIEID" Type="Decimal" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>

                <div class="Form">
                    <asp:FormView ID="FormView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="TICKETID" DataSourceID="TicketTable" ForeColor="Black" GridLines="Both" height="100%" Width="100%">
                        <EditItemTemplate>
                            TICKETID:
                            <asp:Label ID="TICKETIDLabel1" runat="server" Text='<%# Eval("TICKETID") %>' />
                            <br />
                            SEATNUMBER:
                            <asp:TextBox ID="SEATNUMBERTextBox" runat="server" Text='<%# Bind("SEATNUMBER") %>' />
                            <br />
                            TICKETSTATUS:
                            <asp:TextBox ID="TICKETSTATUSTextBox" runat="server" Text='<%# Bind("TICKETSTATUS") %>' />
                            <br />
                            TICKETPURCHASEDATE:
                            <asp:TextBox ID="TICKETPURCHASEDATETextBox" runat="server" Text='<%# Bind("TICKETPURCHASEDATE") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>
                            TICKETID:
                            <asp:TextBox ID="TICKETIDTextBox" runat="server" Text='<%# Bind("TICKETID") %>' />
                            <br />
                            SEATNUMBER:
                            <asp:TextBox ID="SEATNUMBERTextBox" runat="server" Text='<%# Bind("SEATNUMBER") %>' />
                            <br />
                            TICKETSTATUS:
                            <asp:TextBox ID="TICKETSTATUSTextBox" runat="server" Text='<%# Bind("TICKETSTATUS") %>' />
                            <br />
                            TICKETPURCHASEDATE:
                            <asp:TextBox ID="TICKETPURCHASEDATETextBox" runat="server" Text='<%# Bind("TICKETPURCHASEDATE") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            TICKETID:
                            <asp:Label ID="TICKETIDLabel" runat="server" Text='<%# Eval("TICKETID") %>' />
                            <br />
                            SEATNUMBER:
                            <asp:Label ID="SEATNUMBERLabel" runat="server" Text='<%# Bind("SEATNUMBER") %>' />
                            <br />
                            TICKETSTATUS:
                            <asp:Label ID="TICKETSTATUSLabel" runat="server" Text='<%# Bind("TICKETSTATUS") %>' />
                            <br />
                            TICKETPURCHASEDATE:
                            <asp:Label ID="TICKETPURCHASEDATELabel" runat="server" Text='<%# Bind("TICKETPURCHASEDATE") %>' />
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
                <asp:Chart ID="Chart1" runat="server" DataSourceID="TicketTable" Width="500px">
                    <Series>
                        <asp:Series Name="Series1" ChartType="Point" XValueMember="TICKETSTATUS" YValueMembers="TICKETPURCHASEDATE"></asp:Series>
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
