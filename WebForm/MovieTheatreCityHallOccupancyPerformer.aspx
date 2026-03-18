<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MovieTheatreCityHallOccupancyPerformer.aspx.cs" Inherits="WebForm.WebForms.ComplexWebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Top Theatre Occupancy</title>
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
        }
        
        .filter-section select:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        
        .grid-section {
            background: white;
            border-radius: 8px;
            padding: 25px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            overflow-x: auto;
            margin-bottom: 25px;
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
        }
        
        table tbody tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        
        table tbody td {
            padding: 12px 15px;
            color: #2c3e50;
        }
        
        /* Progress Bar Styling */
        .occupancy-bar {
            display: inline-block;
            width: 150px;
            height: 20px;
            background-color: #ecf0f1;
            border-radius: 10px;
            overflow: hidden;
            vertical-align: middle;
        }
        
        .occupancy-fill {
            height: 100%;
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
        }
        
        /* Occupancy Percentage Styling */
        .occupancy-high {
            color: #27ae60;
            font-weight: 600;
        }
        
        .occupancy-medium {
            color: #f39c12;
            font-weight: 600;
        }
        
        .occupancy-low {
            color: #e74c3c;
            font-weight: 600;
        }
        
        /* Rank Badge */
        .rank-badge {
            display: inline-block;
            width: 35px;
            height: 35px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 50%;
            text-align: center;
            line-height: 35px;
            font-weight: 600;
            font-size: 14px;
        }
        
        /* Empty state */
        .empty-message {
            text-align: center;
            padding: 40px 20px;
            color: #7f8c8d;
            font-size: 14px;
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
            
            .filter-section, .grid-section {
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
            
            .occupancy-bar {
                width: 100px;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <div>
                    <h1>Top Theatre City Hall Occupancy</h1>
                    <p>View the top 3 theatre city halls with maximum seat occupancy percentage for selected movies</p>
                </div>
                <a href="Dashboard.aspx" style="background: rgba(255, 255, 255, 0.2); color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none; font-size: 14px; transition: all 0.3s ease; border: 1px solid rgba(255, 255, 255, 0.3);">Back to Dashboard</a>
            </div>
        </div>
    </header>

    <div class="container">
        <form id="form1" runat="server">
            <!-- Filter Section -->
            <div class="filter-section">
                <label for="MovieSelector">Select a Movie:</label>
                <asp:DropDownList ID="MovieSelector" runat="server" DataSourceID="MovieDataSource" DataTextField="MOVIETITLE" DataValueField="MOVIETITLE" OnSelectedIndexChanged="MovieSelector_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Value="">-- Select Movie --</asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Grid Section -->
            <div class="grid-section">
                <div class="section-title">Top 3 Theatre City Halls by Occupancy</div>
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="complex3" AllowSorting="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Rank">
                            <ItemTemplate>
                                <asp:Label ID="RankLabel" runat="server" CssClass="rank-badge" Text='<%# Eval("RNK") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="MOVIETITLE" HeaderText="Movie Title" />
                        <asp:BoundField DataField="THEATRENAME" HeaderText="Theatre Name" />
                        <asp:BoundField DataField="THEATRECITYHALL" HeaderText="City/Hall" />
                        <asp:BoundField DataField="HALLNAME" HeaderText="Hall Name" />
                        <asp:BoundField DataField="HALLCAPACITY" HeaderText="Capacity" />
                        <asp:BoundField DataField="PAID_TICKETS" HeaderText="Paid Tickets" />
                        <asp:TemplateField HeaderText="Occupancy">
                            <ItemTemplate>
                                <span class='<%# GetOccupancyClass(Eval("OCCUPANCY_PERCENTAGE")) %>'>
                                    <%# Eval("OCCUPANCY_PERCENTAGE", "{0:F2}") %>%
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="empty-message">
                            <p>No occupancy data found. Please select a movie from the dropdown above.</p>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>

            <!-- Data Sources -->
            <asp:SqlDataSource ID="MovieDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT MOVIETITLE FROM MOVIE ORDER BY MOVIETITLE">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="complex3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM (SELECT M.MOVIETITLE, T.THEATRENAME, T.THEATRECITYHALL, H.HALLNAME, H.HALLCAPACITY, COUNT(BT.TICKET_TICKETID) AS PAID_TICKETS, ROUND((COUNT(BT.TICKET_TICKETID) * 100.0 / H.HALLCAPACITY), 2) AS OCCUPANCY_PERCENTAGE, RANK() OVER (ORDER BY ROUND((COUNT(BT.TICKET_TICKETID) * 100.0 / H.HALLCAPACITY), 2) DESC) AS RNK FROM MOVIE M JOIN BOOKING_TICKET BT ON M.MOVIEID = BT.MOVIEV1_MOVIEID JOIN TICKET TK ON BT.TICKET_TICKETID = TK.TICKETID JOIN HALL H ON BT.HALL_HALLID = H.HALLID JOIN THEATRE T ON BT.THEATRE_THEATREID = T.THEATREID WHERE TK.TICKETSTATUS = 'Booked' AND M.MOVIETITLE = :MovieTitle GROUP BY M.MOVIETITLE, T.THEATRENAME, T.THEATRECITYHALL, H.HALLNAME, H.HALLCAPACITY) WHERE RNK &lt;= 3 ORDER BY RNK">
                <SelectParameters>
                    <asp:ControlParameter ControlID="MovieSelector" Name="MovieTitle" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </form>
    </div>

    <footer>
        <p>(c) 2024 Kumari Cinema. All rights reserved.</p>
    </footer>
</body>
</html>
