package org.dapsimni.ctrl.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dapsimni.dao.NoticeDAO;
import org.dapsimni.dto.Notice;

@WebServlet("/EditProNotice.do")
public class EditProNoticeCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public EditProNoticeCtrl() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		Notice notice = new Notice();
		notice.setNo(Integer.parseInt(request.getParameter("no")));
		notice.setTitle(request.getParameter("title"));
		notice.setContent(request.getParameter("content"));
		
		NoticeDAO dao = new NoticeDAO();
		int cnt = dao.editNotice(notice);
		
		if(cnt>0) {
			response.sendRedirect("/pro01/NoticeList.do");
		}
		else {
			response.sendRedirect("/pro01/EditNotice.do?no="+notice.getNo());
		}
	}
}
