
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

@WebServlet("/EditFoodServlet")
public class EditFoodServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = session == null ? null : (User) session.getAttribute("user");

        if (user == null || !"ADMIN".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        try {
            Food food = new Food();

            food.setId(Integer.parseInt(request.getParameter("id")));
            food.setName(request.getParameter("name"));
            food.setCategory(request.getParameter("category"));
            food.setDescription(request.getParameter("description"));
            food.setPrice(Double.parseDouble(request.getParameter("price")));
            food.setAvailability(request.getParameter("availability"));

            FoodDAO dao = new FoodDAO();

            if (dao.editFood(food)) {
                response.sendRedirect(request.getContextPath() + "/GetAllFoodsServlet");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin.jsp?error=edit");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin.jsp?error=invalid");
        }
    }
}
