package com.briup.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.briup.dao.impl.StaffDaoImpl;

/**
 * Servlet implementation class StaffDelAjax
 */
public class StaffDelAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffDelAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String ids = request.getParameter("ids");
			
			String id[] = ids.split(",");
			StaffDaoImpl staffdao = new StaffDaoImpl();
			for(String x : id) {
				if(!x.equals(""))
				staffdao.delStaff(Integer.parseInt(x));
			}
			PrintWriter out = response.getWriter();
			out.write("É¾³ý³É¹¦£¡");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
