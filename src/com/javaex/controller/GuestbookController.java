package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.GuestbookDao;
import com.javaex.util.WebUtil;
import com.javaex.vo.GuestbookVo;

@SuppressWarnings("serial")//부모클래스에 객체가 있기때문
@WebServlet("/gbc")
public class GuestbookController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//System.out.println("guestbookController");
		
		String act = request.getParameter("action");
		
//리스트입력-확인		
		if("add".equals(act)){
			
			System.out.println("action=add");
			
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String content = request.getParameter("content");
	
			//전송된 값을 Vo객체로 만든다
			GuestbookVo guestbookVo= new GuestbookVo(name, password, content);
			   
			//PhoneDao를 메모리에 올린다.
			GuestbookDao guestbookDao = new GuestbookDao();
			//저장한다.
			guestbookDao.guestInsert(guestbookVo);
			
			response.sendRedirect("./gbc");
//삭제폼		
		}else if("deleteForm".equals(act)){
			
			WebUtil.forward(request, response, "/WEB-INF/views/guestbook/deleteForm.jsp");
			
//삭제입력		
		}else if("delete".equals(act)){
			
			System.out.println("action=delete"); 
			
			int no =  Integer.parseInt(request.getParameter("no"));
			String password = request.getParameter("password");
			
			//삭제
			new GuestbookDao().guestbookDelete(no, password);
			
			WebUtil.redirect(request, response, "./gbc");
//리스트			
		}else {
			System.out.println("action=addList");
			
			List<GuestbookVo> guestbookList = new GuestbookDao().getList();
			
			// 포워드
			request.setAttribute("guestbookList", guestbookList); // 주소만 준거다
			
			WebUtil.forward(request, response, "/WEB-INF/views/guestbook/addList.jsp");
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}