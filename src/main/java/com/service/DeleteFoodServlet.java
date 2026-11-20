
package com.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.FoodDAO;
import com.model.User;

@WebServlet("/DeleteFoodServlet")
public class DeleteFoodServlet extends HttpServlet {

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
            int id = Integer.parseInt(request.getParameter("id"));

            FoodDAO dao = new FoodDAO();

            if (dao.deleteFood(id)) {
                response.sendRedirect(request.getContextPath() + "/GetAllFoodsServlet");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin.jsp?error=delete");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/GetAllFoodsServlet");
        }
    }
}
