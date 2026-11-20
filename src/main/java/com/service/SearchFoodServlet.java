
package com.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.FoodDAO;
import com.model.Food;

@WebServlet("/SearchFoodServlet")
public class SearchFoodServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");

        if (name == null) {
            name = "";
        }

        FoodDAO dao = new FoodDAO();

        List<Food> foods = dao.searchFood(name);

        request.setAttribute("foods", foods);
        request.setAttribute("searchName", name);

        request.getRequestDispatcher("/viewemps.jsp").forward(request, response);
    }
}
