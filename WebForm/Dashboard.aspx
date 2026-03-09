<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WebForm.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Kumari Cinema - Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            min-height: 100vh;
            padding: 0;
            margin: 0;
        }
        
        header {
            background: linear-gradient(135deg, #0f3460 0%, #1a1a2e 100%);
            color: white;
            padding: 40px 20px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            text-align: center;
            margin-bottom: 50px;
            border-bottom: 3px solid #e94560;
        }
        
        header h1 {
            font-size: 42px;
            font-weight: 700;
            margin-bottom: 10px;
            letter-spacing: 1px;
            color: #ffffff;
        }
        
        header p {
            font-size: 16px;
            color: #a8dadc;
            font-weight: 300;
        }
        
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .dashboard-intro {
            display: none;
        }
        
        .modules-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-bottom: 50px;
        }
        
        .category-header {
            margin-bottom: 40px;
        }
        
        .category-header h2 {
            color: white;
            font-size: 32px;
            margin-bottom: 10px;
            font-weight: 700;
            color: #e94560;
        }
        
        .category-header p {
            color: #a8dadc;
            font-size: 16px;
            font-weight: 300;
        }
        
        .module-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
            cursor: pointer;
            border-left: 5px solid #e94560;
        }
        
        .module-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 24px rgba(233, 69, 96, 0.3);
        }
        
        .module-header {
            padding: 30px 25px 20px;
            background: linear-gradient(135deg, #0f3460 0%, #1a1a2e 100%);
            color: white;
        }
        
        .module-card h3 {
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 5px;
            color: #e94560;
        }
        
        .module-card p {
            font-size: 13px;
            color: #a8dadc;
            opacity: 0.9;
        }
        
        .module-body {
            padding: 20px 25px;
            color: #1a1a2e;
        }
        
        .module-body p {
            font-size: 14px;
            color: #555555;
            margin-bottom: 20px;
            line-height: 1.6;
        }
        
        .module-button {
            display: inline-block;
            background: linear-gradient(135deg, #e94560 0%, #d93550 100%);
            color: white;
            padding: 12px 30px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }
        
        .module-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(233, 69, 96, 0.4);
        }
        
        .module-button:active {
            transform: translateY(0);
        }
        
        footer {
            background: #0f3460;
            color: white;
            text-align: center;
            padding: 30px 20px;
            margin-top: 50px;
            font-size: 13px;
            border-top: 3px solid #e94560;
        }
        
        footer p {
            margin-bottom: 5px;
        }
        
        .stats-section {
            display: none;
        }
        
        @media (max-width: 768px) {
            header h1 {
                font-size: 28px;
            }
            
            .container {
                padding: 0 15px;
            }
            
            .modules-grid {
                grid-template-columns: 1fr;
                gap: 20px;
            }
            
            .dashboard-intro {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <h1>Kumari Cinema</h1>
            <p>Manage Movies, Theatres, Halls, Tickets, and Bookings</p>
        </div>
    </header>

    <div class="container">
        <form id="form1" runat="server">
            <!-- Welcome Section -->
            <div class="dashboard-intro">
                <h2>Welcome to Kumari Cinema Management Dashboard</h2>
                <p>
                    Access all cinema management modules from one central hub. Manage your movies, theatres, halls, 
                    tickets, and view detailed booking analytics. Select a module below to get started.
                </p>
            </div>

            <!-- Statistics Section -->
            <div class="stats-section">
                <div class="stat-card">
                    <div class="stat-number">3</div>
                    <div class="stat-label">Analytics Modules</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">5</div>
                    <div class="stat-label">Management Modules</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">100%</div>
                    <div class="stat-label">Data Accuracy</div>
                </div>
            </div>

            <!-- Analytics & Reports Section -->
            <div style="margin-bottom: 60px;">
                <div class="category-header">
                    <h2>Analytics & Reports</h2>
                    <p>Advanced analytics for booking patterns, occupancy metrics, and performance insights</p>
                </div>
                
                <div class="modules-grid">
                    <!-- User Booking Details -->
                    <div class="module-card">
                        <div class="module-header">
                            <h3>User Bookings</h3>
                            <p>View booking details by user</p>
                        </div>
                        <div class="module-body">
                            <p>Browse and manage user booking information with ticket details. Filter by user and view all their reservations.</p>
                            <a href="User%20Ticket.aspx" class="module-button">Access Module</a>
                        </div>
                    </div>

                    <!-- Theatre City Hall Occupancy -->
                    <div class="module-card">
                        <div class="module-header">
                            <h3>Theatre Schedule</h3>
                            <p>Manage theatre and movie schedules</p>
                        </div>
                        <div class="module-body">
                            <p>View theatre locations with associated movie schedules, show dates, and timings. Perfect for scheduling management.</p>
                            <a href="TheatreCityHall%20Movie.aspx" class="module-button">Access Module</a>
                        </div>
                    </div>

                    <!-- Top Theatre Occupancy -->
                    <div class="module-card">
                        <div class="module-header">
                            <h3>Occupancy Analytics</h3>
                            <p>Top theatre occupancy metrics</p>
                        </div>
                        <div class="module-body">
                            <p>Analyze theatre city hall occupancy percentages for movies. Identify peak-performing locations based on paid bookings.</p>
                            <a href="MovieTheatreCityHallOccupancyPerformer.aspx" class="module-button">Access Module</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Management & CRUD Section -->
            <div>
                <div class="category-header">
                    <h2>Management & Operations</h2>
                    <p>Create, read, update, and delete core cinema entities and resources</p>
                </div>
                
                <div class="modules-grid">
                    <!-- Hall Management -->
                    <div class="module-card">
                        <div class="module-header">
                            <h3>Hall Management</h3>
                            <p>Manage cinema halls</p>
                        </div>
                        <div class="module-body">
                            <p>Create, view, and manage cinema hall details including capacity, facilities, and configurations.</p>
                            <a href="Hall.aspx" class="module-button">Access Module</a>
                        </div>
                    </div>

                    <!-- Movie Management -->
                    <div class="module-card">
                        <div class="module-header">
                            <h3>Movie Management</h3>
                            <p>Manage cinema movies</p>
                        </div>
                        <div class="module-body">
                            <p>Create, view, and manage movie details including title, genre, language, duration, and release dates.</p>
                            <a href="Movie.aspx" class="module-button">Access Module</a>
                        </div>
                    </div>

                    <!-- Theatre Management -->
                    <div class="module-card">
                        <div class="module-header">
                            <h3>Theatre Management</h3>
                            <p>Manage cinema theatres</p>
                        </div>
                        <div class="module-body">
                            <p>Manage theatre locations, names, city halls, and contact information. Organize multi-theatre operations.</p>
                            <a href="Theater.aspx" class="module-button">Access Module</a>
                        </div>
                    </div>

                    <!-- Ticket Management -->
                    <div class="module-card">
                        <div class="module-header">
                            <h3>Ticket Management</h3>
                            <p>Manage cinema tickets</p>
                        </div>
                        <div class="module-body">
                            <p>Create, view, and manage ticket information including seat numbers, prices, and booking status.</p>
                            <a href="Ticket.aspx" class="module-button">Access Module</a>
                        </div>
                    </div>

                    <!-- User Management -->
                    <div class="module-card">
                        <div class="module-header">
                            <h3>User Management</h3>
                            <p>Manage cinema users</p>
                        </div>
                        <div class="module-body">
                            <p>Create, view, and manage user information including username, address, and contact details.</p>
                            <a href="User.aspx" class="module-button">Access Module</a>
                        </div>
                    </div>
                </div>
            </div>

        </form>
    </div>

    <footer>
        <p>Copyright 2024 Cinema Management. All rights reserved.</p>
        <p>Professional Cinema Management Solution</p>
    </footer>
</body>
</html>
