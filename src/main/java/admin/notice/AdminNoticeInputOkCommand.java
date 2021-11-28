package admin.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.AdminInterface;
import dao.NoticeDAO;
import vo.NoticeVO;

public class AdminNoticeInputOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
		
		String title = request.getParameter("title")== null ? "" :request.getParameter("title");
		String content = request.getParameter("content")== null ? "" :request.getParameter("content");
		String hostIp = request.getParameter("hostIp")== null ? "" :request.getParameter("hostIp");
		
		
		// title 필드에 태그사용금지 시킨다(< -> &lt; , > -> &gt;)
		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		
		NoticeVO vo = new NoticeVO();
		vo.setMid(mid);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		NoticeDAO dao = new NoticeDAO();
		
		int res = dao.setNoticeInput(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "NoticeInputOk");
			request.setAttribute("url", request.getContextPath()+"/adminNotice.boss");
		}
		else {
			request.setAttribute("msg", "NoticeInputNo");
			request.setAttribute("url", request.getContextPath()+"/adminNotice.boss");
		}
		

	}

}
