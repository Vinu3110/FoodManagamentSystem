
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.User;

public class UserDAO {

    public boolean registerUser(User user) {

        String query = "INSERT INTO users(name, email, password, role) VALUES(?,?,?,'USER')";

        try (Connection connection = ConnectionManager.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {

            if (connection == null) {
                return false;
            }

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());

            int result = ps.executeUpdate();
            connection.commit();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public User checkLogin(String email, String password) {

        User user = null;

        String query = "SELECT * FROM users WHERE email=? AND password=?";

        try (Connection connection = ConnectionManager.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {

            if (connection == null) {
                return null;
            }

            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    user = new User();

                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setRole(rs.getString("role"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public User getUserById(int id) {

        User user = null;

        String query = "SELECT * FROM users WHERE id=?";

        try (Connection connection = ConnectionManager.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {

            if (connection == null) {
                return null;
            }

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    user = new User();

                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setRole(rs.getString("role"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
