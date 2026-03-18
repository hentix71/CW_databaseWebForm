<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="WebForm.User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>User Management - Cinema System</title>
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
        
        .validation-error {
            color: #e74c3c;
            font-size: 12px;
            margin-top: 4px;
            display: block;
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
                <h1>User Management</h1>
            </div>
            <a href="Dashboard.aspx" class="nav-link">Back to Dashboard</a>
        </header>

        <div class="container">
            <div class="main">
                <!-- Grid View Section -->
                <div class="section">
                    <h2>User Records</h2>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="USERID" DataSourceID="UserTable" AllowSorting="True" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="USERID" HeaderText="ID" ReadOnly="True" SortExpression="USERID" />
                            <asp:BoundField DataField="USERNAME" HeaderText="Username" SortExpression="USERNAME" />
                            <asp:BoundField DataField="ADDRESS" HeaderText="Address" SortExpression="ADDRESS" />
                            <asp:BoundField DataField="Phone_Number" HeaderText="Phone" SortExpression="Phone_Number" />
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
                </div>

                <!-- Form View Section -->
                <div class="section">
                    <h2>Add New User</h2>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="USERID" DataSourceID="UserTable" DefaultMode="Insert">
                        <InsertItemTemplate>
                            <div class="form-group">
                                <label>User ID:</label>
                                <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' />
                                <asp:RequiredFieldValidator ID="USERIDValidator" runat="server" 
                                    ControlToValidate="USERIDTextBox" 
                                    ErrorMessage="User ID is required" 
                                    CssClass="validation-error" />
                            </div>
                            <div class="form-group">
                                <label>Username:</label>
                                <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' />
                                <asp:RequiredFieldValidator ID="USERNAMEValidator" runat="server" 
                                    ControlToValidate="USERNAMETextBox" 
                                    ErrorMessage="Username is required" 
                                    CssClass="validation-error" />
                            </div>
                            <div class="form-group">
                                <label>Address:</label>
                                <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
                                <asp:RequiredFieldValidator ID="ADDRESSValidator" runat="server" 
                                    ControlToValidate="ADDRESSTextBox" 
                                    ErrorMessage="Address is required" 
                                    CssClass="validation-error" />
                            </div>
                            <div class="form-group">
                                <label>Phone Number:</label>
                                <asp:TextBox ID="Phone_NumberTextBox" runat="server" Text='<%# Bind("Phone_Number") %>' />
                                <asp:RequiredFieldValidator ID="PhoneValidator" runat="server" 
                                    ControlToValidate="Phone_NumberTextBox" 
                                    ErrorMessage="Phone Number is required" 
                                    CssClass="validation-error" />
                            </div>
                            <div class="button-group">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary" Text="Add User" />
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
