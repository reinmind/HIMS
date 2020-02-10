package com.briup.web.controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.briup.bean.Staff;
import com.briup.common.util.PageUtil;
import com.briup.dao.impl.StaffDaoImpl;

/**
 * Servlet implementation class ShowStaffs
 */
public class ShowStaffs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowStaffs() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Vector<Staff> staffs ;
		StaffDaoImpl staffdao = new StaffDaoImpl();
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int totalCount = staffdao.getStaffsNum();
		int totalPage = totalCount/5 ;
		if(totalPage % 5 != 0) {
			++totalPage;
		}
		if(currentPage == 0) {
			currentPage = totalPage;
		}
		int past = (currentPage-1) * 5;
		HttpSession session = request.getSession();
		session.setAttribute("totalPage", totalPage);
		session.setAttribute("currentPage", currentPage);
		staffs = staffdao.getStaffs(past, 5);
		session.setAttribute("staffs", staffs);
		session.setAttribute("totalCount", totalCount);
		response.sendRedirect("html/staff.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
