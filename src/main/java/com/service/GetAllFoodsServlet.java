
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

@WebServlet("/GetAllFoodsServlet")
public class GetAllFoodsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        FoodDAO dao = new FoodDAO();

        List<Food> foods = dao.fetchAllData();

        request.setAttribute("foods", foods);

        request.getRequestDispatcher("/viewemps.jsp").forward(request, response);
    }
}
