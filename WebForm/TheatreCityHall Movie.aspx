<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TheatreCityHall Movie.aspx.cs" Inherits="WebForm.WebForms.ComplexWebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Theatre & Movie Booking Details</title>
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
            margin: 0;
        }
        
        header {
            background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
            color: white;
            padding: 30px 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        
        header h1 {
            font-size: 32px;
            font-weight: 600;
            margin-bottom: 8px;
            letter-spacing: 0.5px;
        }
        
        header p {
            font-size: 14px;
            color: #bdc3c7;
            font-weight: 300;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .filter-section {
            background: white;
            border-radius: 8px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        
        .filter-section label {
            display: block;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 8px;
            font-size: 14px;
        }
        
        .filter-section select {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #ecf0f1;
            border-radius: 5px;
            font-size: 14px;
            color: #2c3e50;
            background-color: white;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .filter-section select:hover {
            border-color: #667eea;
        }
        
        .filter-section select:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        
        .details-section {
            background: white;
            border-radius: 8px;
            padding: 25px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 25px;
        }
        
        .grid-section {
            background: white;
            border-radius: 8px;
            padding: 25px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            overflow-x: auto;
        }
        
        .section-title {
            font-size: 20px;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }
        
        .section-title:before {
            content: '';
            width: 4px;
            height: 24px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 2px;
            margin-right: 12px;
        }
        
        /* Form View Styling */
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 8px;
            font-size: 13px;
        }
        
        .form-group span {
            display: block;
            padding: 10px 12px;
            background-color: #f8f9fa;
            border: 1px solid #ecf0f1;
            border-radius: 5px;
            color: #2c3e50;
            font-size: 14px;
        }
        
        .form-group input[type="text"] {
            width: 100%;
            padding: 10px 12px;
            border: 2px solid #ecf0f1;
            border-radius: 5px;
            font-size: 14px;
            color: #2c3e50;
            transition: all 0.3s ease;
        }
        
        .form-group input[type="text"]:hover {
            border-color: #667eea;
        }
        
        .form-group input[type="text"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        
        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        
        .button-group a {
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            font-size: 14px;
        }
        
        .button-group .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .button-group .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
        }
        
        .button-group .btn-secondary {
            background-color: #ecf0f1;
            color: #2c3e50;
        }
        
        .button-group .btn-secondary:hover {
            background-color: #bdc3c7;
        }
        
        /* Empty state */
        .empty-message {
            text-align: center;
            padding: 40px 20px;
            color: #7f8c8d;
            font-size: 14px;
        }
        
        /* GridView Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }
        
        table thead tr {
            background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
            color: white;
        }
        
        table th {
            padding: 15px;
            text-align: left;
            font-weight: 600;
            border-bottom: 2px solid #2c3e50;
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
        
        /* Footer */
        footer {
            text-align: center;
            padding: 20px;
            color: white;
            font-size: 12px;
            margin-top: 40px;
        }
        
        /* Responsive design */
        @media (max-width: 768px) {
            header h1 {
                font-size: 24px;
            }
            
            .container {
                padding: 0 15px;
            }
            
            .filter-section, .details-section {
                padding: 15px;
            }
            
            table {
                font-size: 12px;
            }
            
            table th, table td {
                padding: 8px;
            }
            
            .section-title {
                font-size: 18px;
            }
            
            .button-group {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <div>
                    <h1>?? Theatre & Movie Schedule</h1>
                    <p>View theatre and movie information with show details</p>
                </div>
                <a href="Dashboard.aspx" style="background: rgba(255, 255, 255, 0.2); color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none; font-size: 14px; transition: all 0.3s ease; border: 1px solid rgba(255, 255, 255, 0.3);">? Back to Dashboard</a>
            </div>
        </div>
    </header>

    <div class="container">
        <form id="form1" runat="server">
            <!-- Filter Section -->
            <div class="filter-section">
                <label for="FormView1">Select a Theatre:</label>
                <asp:DropDownList ID="TheatreSelector" runat="server" DataSourceID="TheatreDataSource" DataTextField="THEATRECITYHALL" DataValueField="THEATRECITYHALL" OnSelectedIndexChanged="TheatreSelector_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Value="">-- Select Theatre --</asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Details Section -->
            <div class="grid-section">
                <div class="section-title">Theatre & Movie Schedule</div>
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="Complex2" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="THEATRECITYHALL" HeaderText="Theatre/City Hall" SortExpression="THEATRECITYHALL" />
                        <asp:BoundField DataField="MOVIETITLE" HeaderText="Movie Title" SortExpression="MOVIETITLE" />
                        <asp:BoundField DataField="MOVIEGENRE" HeaderText="Genre" SortExpression="MOVIEGENRE" />
                        <asp:BoundField DataField="MOVIEDURATION" HeaderText="Duration" SortExpression="MOVIEDURATION" />
                        <asp:BoundField DataField="SHOWDATE" HeaderText="Show Date" SortExpression="SHOWDATE" />
                        <asp:BoundField DataField="SHOWTIME" HeaderText="Show Time" SortExpression="SHOWTIME" />
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="empty-message">
                            <p>?? No theatre or movie records found. Please select a theatre from the dropdown above.</p>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>

            <!-- Data Sources -->
            <asp:SqlDataSource ID="TheatreDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT THEATRECITYHALL FROM THEATRE ORDER BY THEATRECITYHALL">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="Complex2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT t.THEATRECITYHALL, m.MOVIETITLE, m.MOVIEGENRE, m.MOVIEDURATION, s.SHOWDATE, s.SHOWTIME FROM THEATRE t, BOOKING_TICKET bt, MOVIE m, SHOW s WHERE t.THEATREID = bt.THEATRE_THEATREID AND bt.MOVIEV1_MOVIEID = m.MOVIEID AND bt.SHOWV1_SHOWID = s.SHOWID AND (t.THEATRECITYHALL = :Theatre)" OnSelecting="Complex2_Selecting">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TheatreSelector" Name="Theatre" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </form>
    </div>

    <footer>
        <p>(c) 2024 Kumari Cinema. All rights reserved.</p>
    </footer>
</body>
</html>
