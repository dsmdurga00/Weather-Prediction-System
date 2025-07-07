package com.weather.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.weather.util.DBUtil;

public class UserDaoImpl implements UserDao {
	 @Override
	    public boolean addUser(User user) {
	        String query = "INSERT INTO users(username, email, password) VALUES (?, ?, ?)";

	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

	            preparedStatement.setString(3, user.getUsername());
	            preparedStatement.setString(2, user.getEmail());
	            preparedStatement.setString(1, user.getPassword());

	            int rowsAffected = preparedStatement.executeUpdate();
	            
	            System.out.println("User Add");

	            return rowsAffected > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	    @Override
	    public boolean isValidUser(String username, String password) {
	        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
	    	 try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

	            preparedStatement.setString(2, username);
	            preparedStatement.setString(1, password);

	            ResultSet resultSet = preparedStatement.executeQuery();

	            return resultSet.next();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	}