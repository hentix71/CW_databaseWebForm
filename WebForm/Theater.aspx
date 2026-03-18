<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Theater.aspx.cs" Inherits="WebForm.Theater" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Theatre Management - Cinema System</title>
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
            border: 1px solid rgba(255, 255, 255, 0.3);
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
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .btn-secondary {
            background: #ecf0f1;
            color: #2c3e50;
        }
        
        .btn-danger {
            background: #e74c3c;
            color: white;
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
                font-size: 11px;
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
                <h1>Theatre Management</h1>
            </div>
            <a href="Dashboard.aspx" class="nav-link">Back to Dashboard</a>
        </header>

        <div class="container">
            <div class="main">
                <!-- Grid View Section -->
                <div class="section">
                    <h2>Theatre Records</h2>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="THEATREID" DataSourceID="TheatreTable" GridLines="Vertical">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="THEATREID" HeaderText="ID" ReadOnly="True" SortExpression="THEATREID" />
                            <asp:BoundField DataField="THEATRENAME" HeaderText="Name" SortExpression="THEATRENAME" />
                            <asp:BoundField DataField="THEATRECITYHALL" HeaderText="City/Hall" SortExpression="THEATRECITYHALL" />
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

                <!-- Form View Section -->
                <div class="section">
                    <h2>Add New Theatre</h2>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="THEATREID" DataSourceID="TheatreTable" DefaultMode="Insert">
                        <InsertItemTemplate>
                            <div class="form-group">
                                <label>Theatre ID:</label>
                                <asp:TextBox ID="THEATREIDTextBox" runat="server" Text='<%# Bind("THEATREID") %>' />
                            </div>
                            <div class="form-group">
                                <label>Theatre Name:</label>
                                <asp:TextBox ID="THEATRENAMETextBox" runat="server" Text='<%# Bind("THEATRENAME") %>' />
                            </div>
                            <div class="form-group">
                                <label>City/Hall:</label>
                                <asp:TextBox ID="THEATRECITYHALLTextBox" runat="server" Text='<%# Bind("THEATRECITYHALL") %>' />
                            </div>
                            <div class="button-group">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary" Text="Add Theatre" />
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
