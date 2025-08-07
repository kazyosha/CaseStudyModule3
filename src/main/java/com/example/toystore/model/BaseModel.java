package com.example.toystore.model;

import com.example.toystore.database.DBConnect;

import java.sql.Connection;

public class BaseModel {
    protected Connection conn;

    public BaseModel() {
        DBConnect dbConnect = new DBConnect();
        conn = dbConnect.getConnect();
    }
}
