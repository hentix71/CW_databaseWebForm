<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hall.aspx.cs" Inherits="WebForm.Hall" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Hall Management - Cinema System</title>
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
        
        /* Chart Styling */
        .chart-container {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 50px;
        }
        
        .chart-container h2 {
            color: #2c3e50;
            margin-bottom: 20px;
            font-size: 22px;
            display: flex;
            align-items: center;
        }
        
        .chart-container h2:before {
            content: '';
            width: 4px;
            height: 24px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 2px;
            margin-right: 12px;
        }
        
        .chart-wrapper {
            text-align: center;
        }
        
        .chart-wrapper asp:Chart {
            margin: 0 auto;
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
                <h1>Hall Management</h1>
            </div>
            <a href="Dashboard.aspx" class="nav-link">Back to Dashboard</a>
        </header>

        <div class="container">
            <div class="main">
                <!-- Grid View Section -->
                <div class="section">
                    <h2>Hall Records</h2>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="HALLID" DataSourceID="HallTable" GridLines="Vertical">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="HALLID" HeaderText="HALLID" ReadOnly="True" SortExpression="HALLID" />
                            <asp:BoundField DataField="HALLNAME" HeaderText="HALLNAME" SortExpression="HALLNAME" />
                            <asp:BoundField DataField="HALLCAPACITY" HeaderText="HALLCAPACITY" SortExpression="HALLCAPACITY" />
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

                <!-- Form View Section -->
                <div class="section">
                    <h2>Edit / Create Hall</h2>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="HALLID" DataSourceID="HallTable">
                        <EditItemTemplate>
                            <div class="form-group">
                                <label>HALLID:</label>
                                <asp:Label ID="HALLIDLabel1" runat="server" Text='<%# Eval("HALLID") %>' style="display: block; padding: 10px; background: #f8f9fa; border-radius: 5px;" />
                            </div>
                            <div class="form-group">
                                <label>HALLNAME:</label>
                                <asp:TextBox ID="HALLNAMETextBox" runat="server" Text='<%# Bind("HALLNAME") %>' />
                            </div>
                            <div class="form-group">
                                <label>HALLCAPACITY:</label>
                                <asp:TextBox ID="HALLCAPACITYTextBox" runat="server" Text='<%# Bind("HALLCAPACITY") %>' />
                            </div>
                            <div class="button-group">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-primary" Text="Update" />
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-secondary" Text="Cancel" />
                            </div>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <div class="form-group">
                                <label>HALLID:</label>
                                <asp:TextBox ID="HALLIDTextBox" runat="server" Text='<%# Bind("HALLID") %>' />
                            </div>
                            <div class="form-group">
                                <label>HALLNAME:</label>
                                <asp:TextBox ID="HALLNAMETextBox" runat="server" Text='<%# Bind("HALLNAME") %>' />
                            </div>
                            <div class="form-group">
                                <label>HALLCAPACITY:</label>
                                <asp:TextBox ID="HALLCAPACITYTextBox" runat="server" Text='<%# Bind("HALLCAPACITY") %>' />
                            </div>
                            <div class="button-group">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary" Text="Insert" />
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-secondary" Text="Cancel" />
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div class="form-group">
                                <label>HALLID:</label>
                                <asp:Label ID="HALLIDLabel" runat="server" Text='<%# Eval("HALLID") %>' style="display: block; padding: 10px; background: #f8f9fa; border-radius: 5px;" />
                            </div>
                            <div class="form-group">
                                <label>HALLNAME:</label>
                                <asp:Label ID="HALLNAMELabel" runat="server" Text='<%# Bind("HALLNAME") %>' style="display: block; padding: 10px; background: #f8f9fa; border-radius: 5px;" />
                            </div>
                            <div class="form-group">
                                <label>HALLCAPACITY:</label>
                                <asp:Label ID="HALLCAPACITYLabel" runat="server" Text='<%# Bind("HALLCAPACITY") %>' style="display: block; padding: 10px; background: #f8f9fa; border-radius: 5px;" />
                            </div>
                            <div class="button-group">
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary" Text="Edit" />
                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger" Text="Delete" />
                                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="btn btn-primary" Text="New" />
                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>

            <!-- Chart Section -->
            <div class="chart-container">
                <h2>Hall Capacity Visualization</h2>
                <div class="chart-wrapper">
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="HallTable" Width="800px" Height="400px">
                        <Series>
                            <asp:Series Name="Capacity" ChartType="Column" XValueMember="HALLNAME" YValueMembers="HALLCAPACITY"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
            </div>
        </div>

        <footer>
            <p>Copyright 2024 Cinema Management. All rights reserved.</p>
        </footer>
    </form>
</body>
</html>
