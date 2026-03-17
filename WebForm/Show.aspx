<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="WebForm.Show" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Show Management - Cinema System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 0;
        }
        
        header {
            background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
            color: white;
            padding: 30px 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        header h1 {
            font-size: 32px;
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .nav-link {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
        
        .nav-link:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .main {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-bottom: 50px;
        }
        
        .section {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        .section h2 {
            color: #2c3e50;
            margin-bottom: 20px;
            font-size: 22px;
            display: flex;
            align-items: center;
        }
        
        .section h2:before {
            content: '';
            width: 4px;
            height: 24px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 2px;
            margin-right: 12px;
        }
        
        /* GridView Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
            margin-bottom: 15px;
        }
        
        table thead tr {
            background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
            color: white;
        }
        
        table th {
            padding: 15px;
            text-align: left;
            font-weight: 600;
        }
        
        table tbody tr {
            border-bottom: 1px solid #ecf0f1;
            transition: background-color 0.3s ease;
        }
        
        table tbody tr:hover {
            background-color: #f8f9fa;
        }
        
        table tbody tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        
        table tbody td {
            padding: 12px 15px;
            color: #2c3e50;
            font-size: 13px;
        }
        
        /* Form Styling */
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-group label {
            display: block;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 6px;
            font-size: 13px;
        }
        
        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 10px 12px;
            border: 2px solid #ecf0f1;
            border-radius: 5px;
            font-size: 14px;
            transition: all 0.3s ease;
        }
        
        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        
        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        
        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
            cursor: pointer;
            border: none;
            font-size: 14px;
            transition: all 0.3s ease;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
        }
        
        .btn-secondary {
            background: #ecf0f1;
            color: #2c3e50;
        }
        
        .btn-secondary:hover {
            background: #bdc3c7;
        }
        
        .btn-danger {
            background: #e74c3c;
            color: white;
        }
        
        .btn-danger:hover {
            background: #c0392b;
        }
        
        footer {
            background: #2c3e50;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 50px;
            font-size: 12px;
        }
        
        /* Responsive */
        @media (max-width: 1024px) {
            .main {
                grid-template-columns: 1fr;
            }
        }
        
        @media (max-width: 768px) {
            header {
                flex-direction: column;
                gap: 15px;
            }
            
            header h1 {
                font-size: 24px;
            }
            
            .main {
                gap: 20px;
            }
            
            table {
                font-size: 12px;
            }
            
            table th, table td {
                padding: 8px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div>
                <h1>Show Management</h1>
            </div>
            <a href="Dashboard.aspx" class="nav-link">Back to Dashboard</a>
        </header>

        <div class="container">
            <div class="main">
                <!-- Grid View Section -->
                <div class="section">
                    <h2>Show Records</h2>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="SHOWID" DataSourceID="ShowTable" AllowSorting="True" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="SHOWID" HeaderText="ID" ReadOnly="True" SortExpression="SHOWID" />
                            <asp:BoundField DataField="SHOWDATE" HeaderText="Show Date" SortExpression="SHOWDATE" />
                            <asp:BoundField DataField="SHOWTIME" HeaderText="Show Time" SortExpression="SHOWTIME" />
                            <asp:BoundField DataField="BASEPRICE" HeaderText="Base Price" SortExpression="BASEPRICE" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="#2c3e50" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#f8f9fa" />
                        <SelectedRowStyle BackColor="#667eea" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007bff" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00396a" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="ShowTable" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;SHOW&quot; WHERE &quot;SHOWID&quot; = :SHOWID" InsertCommand="INSERT INTO &quot;SHOW&quot; (&quot;SHOWID&quot;, &quot;SHOWDATE&quot;, &quot;SHOWTIME&quot;, &quot;BASEPRICE&quot;) VALUES (:SHOWID, TO_DATE(:SHOWDATE, 'MM/DD/YYYY'), :SHOWTIME, :BASEPRICE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;SHOW&quot;" UpdateCommand="UPDATE &quot;SHOW&quot; SET &quot;SHOWDATE&quot; = TO_DATE(:SHOWDATE, 'MM/DD/YYYY'), &quot;SHOWTIME&quot; = :SHOWTIME, &quot;BASEPRICE&quot; = :BASEPRICE WHERE &quot;SHOWID&quot; = :SHOWID">
                        <DeleteParameters>
                            <asp:Parameter Name="SHOWID" Type="Decimal" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="SHOWID" Type="Decimal" />
                            <asp:Parameter Name="SHOWDATE" Type="String" />
                            <asp:Parameter Name="SHOWTIME" Type="String" />
                            <asp:Parameter Name="BASEPRICE" Type="Decimal" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SHOWDATE" Type="String" />
                            <asp:Parameter Name="SHOWTIME" Type="String" />
                            <asp:Parameter Name="BASEPRICE" Type="Decimal" />
                            <asp:Parameter Name="SHOWID" Type="Decimal" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>

                <!-- Form View Section -->
                <div class="section">
                    <h2>Add New Show</h2>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="SHOWID" DataSourceID="ShowTable" DefaultMode="Insert">
                        <InsertItemTemplate>
                            <div class="form-group">
                                <label>Show ID:</label>
                                <asp:TextBox ID="SHOWIDTextBox" runat="server" Text='<%# Bind("SHOWID") %>' />
                            </div>
                            <div class="form-group">
                                <label>Show Date (MM/DD/YYYY):</label>
                                <asp:TextBox ID="SHOWDATETextBox" runat="server" Text='<%# Bind("SHOWDATE") %>' placeholder="MM/DD/YYYY" />
                            </div>
                            <div class="form-group">
                                <label>Show Time:</label>
                                <asp:TextBox ID="SHOWTIMETextBox" runat="server" Text='<%# Bind("SHOWTIME") %>' />
                            </div>
                            <div class="form-group">
                                <label>Base Price:</label>
                                <asp:TextBox ID="BASEPRICETextBox" runat="server" Text='<%# Bind("BASEPRICE") %>' />
                            </div>
                            <div class="button-group">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary" Text="Add Show" />
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-secondary" Text="Cancel" />
                            </div>
                        </InsertItemTemplate>
                    </asp:FormView>
                </div>
        </div>
        </div>

        <footer>
            <p>Copyright 2024 Cinema Management. All rights reserved.</p>
        </footer>
    </form>
</body>
</html>
