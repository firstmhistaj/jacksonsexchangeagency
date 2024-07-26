package com.jacksonsexchangeagency.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jacksonsexchangeagency.model.Interest;
import com.jacksonsexchangeagency.util.DatabaseUtil;

public class InterestDAO {

    public void addInterest(Interest interest) {
        String sql = "INSERT INTO interests (user_id, item_id) VALUES (?, ?)";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, interest.getUserId());
            statement.setInt(2, interest.getItemId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Interest> getInterestsByUserId(int userId) {
        List<Interest> interests = new ArrayList<>();
        String sql = "SELECT id, user_id, item_id FROM interests WHERE user_id = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int itemId = resultSet.getInt("item_id");
                Interest interest = new Interest(id, userId, itemId);
                interests.add(interest);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return interests;
    }
}
