package admin.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;
import dao.NoticeDAO;
import vo.NoticeVO;

public class AdminNoticeUpdateOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title")== null ? "" :request.getParameter("title");
		String content = request.getParameter("content")== null ? "" :request.getParameter("content");
		String hostIp = request.getParameter("hostIp")== null ? "" :request.getParameter("hostIp");
		int idx = request.getParameter("idx")== null ? 0 :Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		
		
		// title 필드에 태그사용금지 시킨다(< -> &lt; , > -> &gt;)
		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		
		NoticeVO vo = new NoticeVO();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		vo.setIdx(idx);
		
		NoticeDAO dao = new NoticeDAO();
		
		int res = dao.setNoticeUpdateOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "noticeUpdateOk");
		}
		else {
			request.setAttribute("msg", "noticeUpdateNo");
		}
		request.setAttribute("url", request.getContextPath()+"/adminNotice.boss?pag="+pag+"&pageSize="+pageSize);

	}

}
