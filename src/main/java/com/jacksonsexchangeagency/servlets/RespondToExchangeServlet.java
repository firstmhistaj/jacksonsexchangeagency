// package com.jacksonsexchangeagency.servlets;

// import javax.servlet.ServletException;
// import javax.servlet.annotation.WebServlet;
// import javax.servlet.http.HttpServlet;
// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;
// import java.io.IOException;
// import java.sql.Connection;
// import java.sql.PreparedStatement;
// import java.sql.ResultSet;
// import java.sql.SQLException;

// @WebServlet("/respondToExchange")
// public class RespondToExchangeServlet extends HttpServlet {
//     private Connection connection;

//     @Override
//     public void init() throws ServletException {
//         connection = DatabaseConnection.getConnection(); // Implement your DB connection
//     }

//     @Override
//     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         int exchangeId = Integer.parseInt(request.getParameter("exchangeId"));
//         String responseValue = request.getParameter("response");

//         String sql = "UPDATE Exchanges SET status = ? WHERE id = ?";
//         try (PreparedStatement stmt = connection.prepareStatement(sql)) {
//             stmt.setString(1, responseValue);
//             stmt.setInt(2, exchangeId);
//             stmt.executeUpdate();

//             // Notify involved users about the decision
//             notifyUsers(exchangeId, responseValue);
//         } catch (SQLException e) {
//             e.printStackTrace();
//         }

//         response.sendRedirect("manageExchanges.jsp");
//     }

//     private void notifyUsers(int exchangeId, String responseValue) throws SQLException {
//         String fetchSql = "SELECT user1_id, user2_id FROM Exchanges WHERE id = ?";
//         try (PreparedStatement fetchStmt = connection.prepareStatement(fetchSql)) {
//             fetchStmt.setInt(1, exchangeId);
//             ResultSet rs = fetchStmt.executeQuery();
//             if (rs.next()) {
//                 int user1Id = rs.getInt("user1_id");
//                 int user2Id = rs.getInt("user2_id");
//                 if ("Accept".equals(responseValue)) {
//                     notifyUser(user1Id, "Your exchange proposal has been accepted.");
//                     notifyUser(user2Id, "Your exchange proposal has been accepted.");
//                 } else {
//                     notifyUser(user1Id, "Your exchange proposal has been rejected.");
//                     notifyUser(user2Id, "Your exchange proposal has been rejected.");
//                 }
//             }
//         }
//     }

//     private void notifyUser(int userId, String message) {
//         String sql = "INSERT INTO Notifications (user_id, message) VALUES (?, ?)";
//         try (PreparedStatement stmt = connection.prepareStatement(sql)) {
//             stmt.setInt(1, userId);
//             stmt.setString(2, message);
//             stmt.executeUpdate();
//         } catch (SQLException e) {
//             e.printStackTrace();
//         }
//     }
// }
