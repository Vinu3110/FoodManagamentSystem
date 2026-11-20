
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Food;

public class FoodDAO {

    public boolean saveFood(Food food) {

        String query = "INSERT INTO foods(name, category, description, price, availability) VALUES(?,?,?,?,?)";

        Connection connection = ConnectionManager.getConnection();

        if (connection == null) {
            return false;
        }

        try (Connection con = connection;
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, food.getName());
            ps.setString(2, food.getCategory());
            ps.setString(3, food.getDescription());
            ps.setDouble(4, food.getPrice());
            ps.setString(5, food.getAvailability());

            int result = ps.executeUpdate();
            con.commit();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            return false;
        }
    }

    public boolean editFood(Food food) {

        String query = "UPDATE foods SET name=?, category=?, description=?, price=?, availability=? WHERE id=?";

        Connection connection = ConnectionManager.getConnection();

        if (connection == null) {
            return false;
        }

        try (Connection con = connection;
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, food.getName());
            ps.setString(2, food.getCategory());
            ps.setString(3, food.getDescription());
            ps.setDouble(4, food.getPrice());
            ps.setString(5, food.getAvailability());
            ps.setInt(6, food.getId());

            int result = ps.executeUpdate();
            con.commit();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            return false;
        }
    }

    public boolean deleteFood(int id) {

        String query = "DELETE FROM foods WHERE id=?";

        Connection connection = ConnectionManager.getConnection();

        if (connection == null) {
            return false;
        }

        try (Connection con = connection;
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);

            int result = ps.executeUpdate();
            con.commit();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            return false;
        }
    }

    public List<Food> fetchAllData() {

        List<Food> foods = new ArrayList<>();

        String query = "SELECT * FROM foods";

        try (Connection connection = ConnectionManager.getConnection()) {

            if (connection == null) {
                return foods;
            }

            try (PreparedStatement ps = connection.prepareStatement(query);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Food food = new Food();

                    food.setId(rs.getInt("id"));
                    food.setName(rs.getString("name"));
                    food.setCategory(rs.getString("category"));
                    food.setDescription(rs.getString("description"));
                    food.setPrice(rs.getDouble("price"));
                    food.setAvailability(rs.getString("availability"));

                    foods.add(food);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return foods;
    }

    public Food fetchFood(int id) {

        Food food = null;

        String query = "SELECT * FROM foods WHERE id=?";

        try (Connection connection = ConnectionManager.getConnection()) {

            if (connection == null) {
                return null;
            }

            try (PreparedStatement ps = connection.prepareStatement(query)) {

                ps.setInt(1, id);

                try (ResultSet rs = ps.executeQuery()) {

                    if (rs.next()) {

                        food = new Food();

                        food.setId(rs.getInt("id"));
                        food.setName(rs.getString("name"));
                        food.setCategory(rs.getString("category"));
                        food.setDescription(rs.getString("description"));
                        food.setPrice(rs.getDouble("price"));
                        food.setAvailability(rs.getString("availability"));
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return food;
    }

    public List<Food> searchFood(String name) {

        List<Food> foods = new ArrayList<>();

        String query = "SELECT * FROM foods WHERE name LIKE ? OR category LIKE ?";

        try (Connection connection = ConnectionManager.getConnection()) {

            if (connection == null) {
                return foods;
            }

            try (PreparedStatement ps = connection.prepareStatement(query)) {

                ps.setString(1, "%" + name + "%");
                ps.setString(2, "%" + name + "%");

                try (ResultSet rs = ps.executeQuery()) {

                    while (rs.next()) {

                        Food food = new Food();

                        food.setId(rs.getInt("id"));
                        food.setName(rs.getString("name"));
                        food.setCategory(rs.getString("category"));
                        food.setDescription(rs.getString("description"));
                        food.setPrice(rs.getDouble("price"));
                        food.setAvailability(rs.getString("availability"));

                        foods.add(food);
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return foods;
    }
}
