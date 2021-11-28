package admin.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;
import dao.NoticeDAO;

public class AdminNoticeDeleteCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));

		NoticeDAO dao = new NoticeDAO();
		
		int res = dao.setNoticeDelete(idx);
		
		if(res == 1) {
			request.setAttribute("msg", "NoticeDeleteOk");
			request.setAttribute("url", request.getContextPath()+"/adminNotice.boss?pag="+pag+"&pageSize="+pageSize);
		}
		else {
			request.setAttribute("msg", "NoticeDeleteNo");
			request.setAttribute("url", request.getContextPath()+"/adminNoticeContent.boss?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		}
	}
}
