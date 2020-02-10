package com.briup.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.briup.bean.Department;
import com.briup.dao.impl.DeptDaoImpl;

/**
 * Servlet implementation class UpdateDept
 */
@WebServlet("/UpdateDept")
public class UpdateDept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDept() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		int flag = Integer.parseInt(request.getParameter("flag"));
		String description =request.getParameter("description");
		Department dept = new Department(id,name,flag,description);
		DeptDaoImpl deptdao = new DeptDaoImpl();
		deptdao.updateDept(dept);
		response.sendRedirect("html/dept.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
