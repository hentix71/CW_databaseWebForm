<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="WebForm.Show" %>

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
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="SHOWID" DataSourceID="ShowTable" ForeColor="Black" height="100%"  Width="100%">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="SHOWID" HeaderText="SHOWID" ReadOnly="True" SortExpression="SHOWID" />
                            <asp:BoundField DataField="SHOWDATE" HeaderText="SHOWDATE" SortExpression="SHOWDATE" />
                            <asp:BoundField DataField="SHOWTIME" HeaderText="SHOWTIME" SortExpression="SHOWTIME" />
                            <asp:BoundField DataField="BASEPRICE" HeaderText="BASEPRICE" SortExpression="BASEPRICE" />
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
                    <asp:SqlDataSource ID="ShowTable" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;SHOW&quot; WHERE &quot;SHOWID&quot; = :SHOWID" InsertCommand="INSERT INTO &quot;SHOW&quot; (&quot;SHOWID&quot;, &quot;SHOWDATE&quot;, &quot;SHOWTIME&quot;, &quot;BASEPRICE&quot;) VALUES (:SHOWID, :SHOWDATE, :SHOWTIME, :BASEPRICE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;SHOW&quot;" UpdateCommand="UPDATE &quot;SHOW&quot; SET &quot;SHOWDATE&quot; = :SHOWDATE, &quot;SHOWTIME&quot; = :SHOWTIME, &quot;BASEPRICE&quot; = :BASEPRICE WHERE &quot;SHOWID&quot; = :SHOWID">
                        <DeleteParameters>
                            <asp:Parameter Name="SHOWID" Type="Decimal" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="SHOWID" Type="Decimal" />
                            <asp:Parameter Name="SHOWDATE" Type="DateTime" />
                            <asp:Parameter Name="SHOWTIME" Type="String" />
                            <asp:Parameter Name="BASEPRICE" Type="Decimal" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SHOWDATE" Type="DateTime" />
                            <asp:Parameter Name="SHOWTIME" Type="String" />
                            <asp:Parameter Name="BASEPRICE" Type="Decimal" />
                            <asp:Parameter Name="SHOWID" Type="Decimal" />
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
                    <asp:FormView ID="FormView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="SHOWID" DataSourceID="ShowTable" ForeColor="Black" GridLines="Both" height="100%" Width="100%">
                        <EditItemTemplate>
                            SHOWID:
                            <asp:Label ID="SHOWIDLabel1" runat="server" Text='<%# Eval("SHOWID") %>' />
                            <br />
                            SHOWDATE:
                            <asp:TextBox ID="SHOWDATETextBox" runat="server" Text='<%# Bind("SHOWDATE") %>' />
                            <br />
                            SHOWTIME:
                            <asp:TextBox ID="SHOWTIMETextBox" runat="server" Text='<%# Bind("SHOWTIME") %>' />
                            <br />
                            BASEPRICE:
                            <asp:TextBox ID="BASEPRICETextBox" runat="server" Text='<%# Bind("BASEPRICE") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>
                            SHOWID:
                            <asp:TextBox ID="SHOWIDTextBox" runat="server" Text='<%# Bind("SHOWID") %>' />
                            <br />
                            SHOWDATE:
                            <asp:TextBox ID="SHOWDATETextBox" runat="server" Text='<%# Bind("SHOWDATE") %>' />
                            <br />
                            SHOWTIME:
                            <asp:TextBox ID="SHOWTIMETextBox" runat="server" Text='<%# Bind("SHOWTIME") %>' />
                            <br />
                            BASEPRICE:
                            <asp:TextBox ID="BASEPRICETextBox" runat="server" Text='<%# Bind("BASEPRICE") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            SHOWID:
                            <asp:Label ID="SHOWIDLabel" runat="server" Text='<%# Eval("SHOWID") %>' />
                            <br />
                            SHOWDATE:
                            <asp:Label ID="SHOWDATELabel" runat="server" Text='<%# Bind("SHOWDATE") %>' />
                            <br />
                            SHOWTIME:
                            <asp:Label ID="SHOWTIMELabel" runat="server" Text='<%# Bind("SHOWTIME") %>' />
                            <br />
                            BASEPRICE:
                            <asp:Label ID="BASEPRICELabel" runat="server" Text='<%# Bind("BASEPRICE") %>' />
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

        <style>
            .left {
                width: 100%;
            }
            
            .Graph {
                display: none;
            }
        </style>
    </form>
</body>
</html>
