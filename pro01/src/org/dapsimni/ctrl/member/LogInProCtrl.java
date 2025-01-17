package org.dapsimni.ctrl.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dapsimni.dao.MemberDAO;
import org.dapsimni.dto.Member;

@WebServlet("/LogInPro.do")
public class LogInProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LogInProCtrl() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDAO dao = new MemberDAO();
		Member member = dao.getMember(id);
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		RequestDispatcher view;
		
		if(id.equals(member.getId()) && pw.equals(member.getPw())) {
			session.setAttribute("sid", member.getId());
			session.setAttribute("sname", member.getName());
			response.sendRedirect("/pro01");
		}
		else if(id.equals(member.getId())) {
			request.setAttribute("message", "해당 회원의 비밀번호가 일치하지 않습니다.");
			view = request.getRequestDispatcher("/member/login.jsp");
			view.forward(request, response);
		}
		else {
			request.setAttribute("message", "해당 회원이 존재하지 않습니다.");
			view = request.getRequestDispatcher("/member/login.jsp");
			view.forward(request, response);
		}
	}

}
