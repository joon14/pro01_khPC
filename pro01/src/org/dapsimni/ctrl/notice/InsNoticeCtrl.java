package org.dapsimni.ctrl.notice;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dapsimni.dao.NoticeDAO;
import org.dapsimni.dto.Notice;

@WebServlet("/InsNotice.do")
public class InsNoticeCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public InsNoticeCtrl() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		Notice notice = new Notice();
		
		notice.setTitle(request.getParameter("title"));
		notice.setContent(request.getParameter("content"));
		
		NoticeDAO dao = new NoticeDAO();
		int cnt = dao.insNotice(notice);
		
		if(cnt>0) {
			System.out.println("공지사항 추가 성공~!");
		} else {
			System.out.println("공지사항 추가 실패~!");
		}
		
		ServletContext application = request.getServletContext();
		String home = application.getContextPath();
		if(cnt>0) {
			response.sendRedirect(home+"/NoticeList.do");
		}
		else {
			response.sendRedirect(home+"/notice/notice_ins.jsp");
		}
	}
}
