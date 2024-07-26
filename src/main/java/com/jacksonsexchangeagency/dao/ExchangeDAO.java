package com.jacksonsexchangeagency.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.jacksonsexchangeagency.model.Exchange;
import com.jacksonsexchangeagency.util.DatabaseUtil;

public class ExchangeDAO {

    public void createExchange(Exchange exchange) {
        String sql = "INSERT INTO exchanges (item_id, user_id, status) VALUES (?, ?, ?)";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, exchange.getItemId());
            statement.setInt(2, exchange.getUserId());
            statement.setString(3, exchange.getStatus());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateExchangeStatus(int id, String status) {
        String sql = "UPDATE exchanges SET status = ? WHERE id = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, status);
            statement.setInt(2, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
