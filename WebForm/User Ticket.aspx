<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User Ticket.aspx.cs" Inherits="WebForm.WebForms.ComplexWebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>User Booking Details</title>
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
        
        .card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            padding: 25px;
            margin-bottom: 25px;
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
            border: none;
            font-size: 14px;
        }
        
        .button-group .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .button-group .btn-secondary {
            background-color: #ecf0f1;
            color: #2c3e50;
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
        
        /* Empty state message */
        .empty-message {
            text-align: center;
            padding: 40px 20px;
            color: #7f8c8d;
            font-size: 14px;
        }
        
        .empty-message p {
            margin: 0;
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
            
            .card, .filter-section, .grid-section {
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
                    <h1>User Booking Details</h1>
                    <p>Manage and view user booking information and ticket details</p>
                </div>
                <a href="Dashboard.aspx" style="background: rgba(255, 255, 255, 0.2); color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none; font-size: 14px; border: 1px solid rgba(255, 255, 255, 0.3);">Back to Dashboard</a>
            </div>
        </div>
    </header>

    <div class="container">
        <form id="form1" runat="server">
            <!-- Filter Section -->
            <div class="filter-section">
                <label for="UserSelector">Select a User:</label>
                <asp:DropDownList ID="UserSelector" runat="server" DataSourceID="UserDataSource" DataTextField="USERNAME" DataValueField="USERID" OnSelectedIndexChanged="UserSelector_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Value="">-- Show All Users --</asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Grid Section -->
            <div class="grid-section">
                <div class="section-title">Booking Records</div>
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USERID,TICKETID" DataSourceID="AllUsersTicket" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="USERID" HeaderText="User ID" ReadOnly="True" SortExpression="USERID" />
                        <asp:BoundField DataField="USERNAME" HeaderText="Username" SortExpression="USERNAME" />
                        <asp:BoundField DataField="ADDRESS" HeaderText="Address" SortExpression="ADDRESS" />
                        <asp:BoundField DataField="Phone_Number" HeaderText="Phone Number" SortExpression="Phone_Number" />
                        <asp:BoundField DataField="TICKETID" HeaderText="Ticket ID" ReadOnly="True" SortExpression="TICKETID" />
                        <asp:BoundField DataField="SEATNUMBER" HeaderText="Seat Number" SortExpression="SEATNUMBER" />
                        <asp:BoundField DataField="TICKETPURCHASEDATE" HeaderText="Purchase Date" SortExpression="TICKETPURCHASEDATE" />
                        <asp:BoundField DataField="MOVIETITLE" HeaderText="Movie Title" SortExpression="MOVIETITLE" />
                        <asp:BoundField DataField="SHOWDATE" HeaderText="Show Date" SortExpression="SHOWDATE" />
                        <asp:BoundField DataField="SHOWTIME" HeaderText="Show Time" SortExpression="SHOWTIME" />
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="empty-message">
                            <p>No booking records found. Please select a user from the dropdown above.</p>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>

            <!-- Data Sources -->
            <asp:SqlDataSource ID="UserDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT USERID, USERNAME FROM &quot;User&quot; ORDER BY USERNAME">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="AllUsersTicket" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT U.USERID, U.USERNAME, U.ADDRESS, U.&quot;Phone_Number&quot;, T.TICKETID, T.SEATNUMBER, T.TICKETPURCHASEDATE, M.MOVIETITLE, S.SHOWDATE, S.SHOWTIME FROM &quot;User&quot; U, USER_BOOKING UB, BOOKING B, BOOKING_TICKET BT, TICKET T, SHOW S, MOVIE M WHERE U.USERID = UB.USER_USERID AND UB.BOOKING_BOOKINGID = B.BOOKINGID AND B.BOOKINGID = BT.BOOKING_BOOKINGID AND BT.TICKET_TICKETID = T.TICKETID AND BT.SHOWV1_SHOWID = S.SHOWID AND BT.MOVIEV1_MOVIEID = M.MOVIEID AND (T.TICKETPURCHASEDATE &gt;= ADD_MONTHS(SYSDATE, - 6))">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="UserTicket" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT U.USERID, U.USERNAME, U.ADDRESS, U.&quot;Phone_Number&quot;, T.TICKETID, T.SEATNUMBER, T.TICKETPURCHASEDATE, M.MOVIETITLE, S.SHOWDATE, S.SHOWTIME FROM &quot;User&quot; U, USER_BOOKING UB, BOOKING B, BOOKING_TICKET BT, TICKET T, SHOW S, MOVIE M WHERE U.USERID = UB.USER_USERID AND UB.BOOKING_BOOKINGID = B.BOOKINGID AND B.BOOKINGID = BT.BOOKING_BOOKINGID AND BT.TICKET_TICKETID = T.TICKETID AND BT.SHOWV1_SHOWID = S.SHOWID AND BT.MOVIEV1_MOVIEID = M.MOVIEID AND (U.USERID = :USERID) AND (T.TICKETPURCHASEDATE &gt;= ADD_MONTHS(SYSDATE, - 6))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="UserSelector" Name="USERID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </form>
    </div>

    <footer>
        <p>(c) 2024 Kumari Cinema. All rights reserved.</p>
    </footer>
</body>
</html>
