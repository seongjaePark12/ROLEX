package admin.simple;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;
import dao.SimpleDAO;
import vo.SimpleVO;

public class AdminSimpleInputOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title")== null ? "" :request.getParameter("title");
		String what = request.getParameter("what")== null ? "" :request.getParameter("what");
		String content = request.getParameter("content")== null ? "" :request.getParameter("content");
		
		// title 필드에 태그사용금지 시킨다(< -> &lt; , > -> &gt;)
		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		
		SimpleVO vo = new SimpleVO();
		vo.setTitle(title);
		vo.setWhat(what);
		vo.setContent(content);
		
		SimpleDAO dao = new SimpleDAO();
		
		int res = dao.setSimpleInput(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "SimpleInputOk");
			request.setAttribute("url", request.getContextPath()+"/adminSimple.boss");
		}
		else {
			request.setAttribute("msg", "SimpleInputNo");
			request.setAttribute("url", request.getContextPath()+"/adminSimple.boss");
		}
	}
}
