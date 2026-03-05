<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Movie.aspx.cs" Inherits="WebForm.Movie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie</title>
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
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="MOVIEID" DataSourceID="MovieTable" ForeColor="Black" height="100%"  Width="100%">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="MOVIEID" HeaderText="MOVIEID" ReadOnly="True" SortExpression="MOVIEID" />
                            <asp:BoundField DataField="MOVIETITLE" HeaderText="MOVIETITLE" SortExpression="MOVIETITLE" />
                            <asp:BoundField DataField="MOVIEDURATION" HeaderText="MOVIEDURATION" SortExpression="MOVIEDURATION" />
                            <asp:BoundField DataField="MOVIELANGUAGE" HeaderText="MOVIELANGUAGE" SortExpression="MOVIELANGUAGE" />
                            <asp:BoundField DataField="MOVIEGENRE" HeaderText="MOVIEGENRE" SortExpression="MOVIEGENRE" />
                            <asp:BoundField DataField="RELEASEDATE" HeaderText="RELEASEDATE" SortExpression="RELEASEDATE" />
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
                    <asp:FormView ID="FormView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="MOVIEID" DataSourceID="MovieTable" ForeColor="Black" GridLines="Both" height="100%" Width="100%">
                        <EditItemTemplate>
                            MOVIEID:
                            <asp:Label ID="MOVIEIDLabel1" runat="server" Text='<%# Eval("MOVIEID") %>' />
                            <br />
                            MOVIETITLE:
                            <asp:TextBox ID="MOVIETITLETextBox" runat="server" Text='<%# Bind("MOVIETITLE") %>' />
                            <br />
                            MOVIEDURATION:
                            <asp:TextBox ID="MOVIEDURATIONTextBox" runat="server" Text='<%# Bind("MOVIEDURATION") %>' />
                            <br />
                            MOVIELANGUAGE:
                            <asp:TextBox ID="MOVIELANGUAGETextBox" runat="server" Text='<%# Bind("MOVIELANGUAGE") %>' />
                            <br />
                            MOVIEGENRE:
                            <asp:TextBox ID="MOVIEGENRETextBox" runat="server" Text='<%# Bind("MOVIEGENRE") %>' />
                            <br />
                            RELEASEDATE:
                            <asp:TextBox ID="RELEASEDATETextBox" runat="server" Text='<%# Bind("RELEASEDATE") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>
                            MOVIEID:
                            <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' />
                            <br />
                            MOVIETITLE:
                            <asp:TextBox ID="MOVIETITLETextBox" runat="server" Text='<%# Bind("MOVIETITLE") %>' />
                            <br />
                            MOVIEDURATION:
                            <asp:TextBox ID="MOVIEDURATIONTextBox" runat="server" Text='<%# Bind("MOVIEDURATION") %>' />
                            <br />
                            MOVIELANGUAGE:
                            <asp:TextBox ID="MOVIELANGUAGETextBox" runat="server" Text='<%# Bind("MOVIELANGUAGE") %>' />
                            <br />
                            MOVIEGENRE:
                            <asp:TextBox ID="MOVIEGENRETextBox" runat="server" Text='<%# Bind("MOVIEGENRE") %>' />
                            <br />
                            RELEASEDATE:
                            <asp:TextBox ID="RELEASEDATETextBox" runat="server" Text='<%# Bind("RELEASEDATE") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            MOVIEID:
                            <asp:Label ID="MOVIEIDLabel" runat="server" Text='<%# Eval("MOVIEID") %>' />
                            <br />
                            MOVIETITLE:
                            <asp:Label ID="MOVIETITLELabel" runat="server" Text='<%# Bind("MOVIETITLE") %>' />
                            <br />
                            MOVIEDURATION:
                            <asp:Label ID="MOVIEDURATIONLabel" runat="server" Text='<%# Bind("MOVIEDURATION") %>' />
                            <br />
                            MOVIELANGUAGE:
                            <asp:Label ID="MOVIELANGUAGELabel" runat="server" Text='<%# Bind("MOVIELANGUAGE") %>' />
                            <br />
                            MOVIEGENRE:
                            <asp:Label ID="MOVIEGENRELabel" runat="server" Text='<%# Bind("MOVIEGENRE") %>' />
                            <br />
                            RELEASEDATE:
                            <asp:Label ID="RELEASEDATELabel" runat="server" Text='<%# Bind("RELEASEDATE") %>' />
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
                <asp:Chart ID="Chart1" runat="server" DataSourceID="MovieTable" Width="500px">
                    <Series>
                        <asp:Series Name="Series1" ChartType="Point" XValueMember="MOVIETITLE" YValueMembers="RELEASEDATE"></asp:Series>
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
