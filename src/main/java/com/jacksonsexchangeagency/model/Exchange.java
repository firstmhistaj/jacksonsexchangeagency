package com.jacksonsexchangeagency.model;

public class Exchange {
    private int id;
    private int itemId;
    private int userId;
    private String status;

    // Constructors
    public Exchange() {}

    public Exchange(int id, int itemId, int userId, String status) {
        this.id = id;
        this.itemId = itemId;
        this.userId = userId;
        this.status = status;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getItemId() { return itemId; }
    public void setItemId(int itemId) { this.itemId = itemId; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
