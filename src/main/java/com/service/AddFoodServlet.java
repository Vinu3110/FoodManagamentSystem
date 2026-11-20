
package com.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.FoodDAO;
import com.model.Food;
import com.model.User;

@WebServlet("/AddFoodServlet")
public class AddFoodServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        User user = session == null ? null :
                (User) session.getAttribute("user");

        // Check admin login
        if (user == null || user.getRole() == null ||
                !"ADMIN".equalsIgnoreCase(user.getRole())) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");
            return;
        }

        try {

            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String description = request.getParameter("description");
            String price = request.getParameter("price");
            String availability = request.getParameter("availability");

            // Validate input
            if (name == null || name.trim().isEmpty()
                    || category == null || category.trim().isEmpty()
                    || price == null || price.trim().isEmpty()
                    || availability == null || availability.trim().isEmpty()) {

                response.sendRedirect(
                        request.getContextPath() + "/foods.jsp?error=empty");
                return;
            }

            Food food = new Food();

            food.setName(name.trim());
            food.setCategory(category);
            food.setDescription(description);
            food.setPrice(Double.parseDouble(price));
            food.setAvailability(availability);

            FoodDAO dao = new FoodDAO();

            if (dao.saveFood(food)) {

                // Food added successfully
                response.sendRedirect(
                        request.getContextPath() + "/GetAllFoodsServlet");

            } else {

                // Insertion failed
                response.sendRedirect(
                        request.getContextPath() + "/foods.jsp?error=add");
            }

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    request.getContextPath() + "/foods.jsp?error=invalid");

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath() + "/foods.jsp?error=failed");
        }
    }
}
