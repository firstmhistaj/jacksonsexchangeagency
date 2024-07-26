package com.jacksonsexchangeagency.model;

public class Item {
    private int id;
    private String name;
    private String description;
    private String category;
    private String condition;
    private String owner;
    private String photoUrl;

    public Item(int id, String name, String description, String category, String condition, String owner, String photoUrl) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.category = category;
        this.condition = condition;
        this.owner = owner;
        this.photoUrl = photoUrl;
    }

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getCondition() { return condition; }
    public void setCondition(String condition) { this.condition = condition; }

    public String getOwner() { return owner; }
    public void setOwner(String owner) { this.owner = owner; }

    public String getPhotoUrl() { return photoUrl; }
    public void setPhotoUrl(String photoUrl) { this.photoUrl = photoUrl; }
}
