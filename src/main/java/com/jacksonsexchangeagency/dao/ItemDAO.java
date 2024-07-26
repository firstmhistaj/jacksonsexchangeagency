package com.jacksonsexchangeagency.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jacksonsexchangeagency.model.Item;
import com.jacksonsexchangeagency.util.DatabaseUtil;

public class ItemDAO {

    // Method to add a new item to the database
    public void addItem(Item item) {
        String sql = "INSERT INTO items (name, description, category, `condition`, owner, photoUrl) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DatabaseUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, item.getName());
            statement.setString(2, item.getDescription());
            statement.setString(3, item.getCategory());
            statement.setString(4, item.getCondition());
            statement.setString(5, item.getOwner());
            statement.setString(6, item.getPhotoUrl());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions as needed
        }
    }

    // Method to update an existing item in the database
    public void updateItem(Item item) {
        String sql = "UPDATE items SET name = ?, description = ?, category = ?, `condition` = ?, owner = ?, photoUrl = ? WHERE id = ?";
        try (Connection connection = DatabaseUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, item.getName());
            statement.setString(2, item.getDescription());
            statement.setString(3, item.getCategory());
            statement.setString(4, item.getCondition());
            statement.setString(5, item.getOwner());
            statement.setString(6, item.getPhotoUrl());
            statement.setInt(7, item.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions as needed
        }
    }

    // Method to delete an item from the database
    public void deleteItem(int id) {
        String sql = "DELETE FROM items WHERE id = ?";
        try (Connection connection = DatabaseUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions as needed
        }
    }

    // Method to get an item by its ID
    public Item getItemById(int id) {
        Item item = null;
        String sql = "SELECT id, name, description, category, `condition`, owner, photoUrl FROM items WHERE id = ?";
        try (Connection connection = DatabaseUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                String category = resultSet.getString("category");
                String condition = resultSet.getString("condition");
                String owner = resultSet.getString("owner");
                String photoUrl = resultSet.getString("photoUrl");
                item = new Item(id, name, description, category, condition, owner, photoUrl);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions as needed
        }
        return item;
    }

    // Method to get all items from the database
    public List<Item> getAllItems() {
        List<Item> items = new ArrayList<>();
        String sql = "SELECT id, name, description, category, `condition`, owner, photoUrl FROM items";
        try (Connection connection = DatabaseUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                String category = resultSet.getString("category");
                String condition = resultSet.getString("condition");
                String owner = resultSet.getString("owner");
                String photoUrl = resultSet.getString("photoUrl");

                Item item = new Item(id, name, description, category, condition, owner, photoUrl);
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions as needed
        }
        return items;
    }

    public void expressInterest(int itemId, int userId) {
        // Implementation for recording the interest in the database.
        // This could involve inserting a record into an interest table.
        // Example SQL could be something like:
        // INSERT INTO interests (item_id, user_id, expressed_on) VALUES (?, ?, NOW());
        String sql = "INSERT INTO interests (item_id, user_id, expressed_on) VALUES (?, ?, NOW())";
        try (Connection connection = DatabaseUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, itemId);
            statement.setInt(2, userId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions as needed
        }
    }

        // Method to finalize the exchange
    public void finalizeExchange(int itemId, int userId) {
        String sql = "UPDATE items SET status = 'exchanged' WHERE id = ?"; // Example status update
        try (Connection connection = DatabaseUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, itemId);
            statement.executeUpdate();
            
            // Example: Remove interest after finalizing
            String deleteSql = "DELETE FROM interests WHERE item_id = ? AND user_id = ?";
            try (PreparedStatement deleteStatement = connection.prepareStatement(deleteSql)) {
                deleteStatement.setInt(1, itemId);
                deleteStatement.setInt(2, userId);
                deleteStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

