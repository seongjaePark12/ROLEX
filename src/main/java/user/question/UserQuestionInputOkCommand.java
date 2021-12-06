package user.question;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.QuestionDAO;
import user.UserInterface;
import vo.QuestionVO;

public class UserQuestionInputOkCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
		
		String title = request.getParameter("title")== null ? "" :request.getParameter("title");
		String what = request.getParameter("what")== null ? "" :request.getParameter("what");
		String content = request.getParameter("content")== null ? "" :request.getParameter("content");
		String hostIp = request.getParameter("hostIp")== null ? "" :request.getParameter("hostIp");
		
		
		// title 필드에 태그사용금지 시킨다(< -> &lt; , > -> &gt;)
		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		
		QuestionVO vo = new QuestionVO();
		vo.setMid(mid);
		vo.setTitle(title);
		vo.setWhat(what);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		QuestionDAO dao = new QuestionDAO();
		
		int res = dao.setQuestionInput(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "QuestionInputOk");
			request.setAttribute("url", request.getContextPath()+"/userQuestion.psj");
		}
		else {
			request.setAttribute("msg", "QuestionInputNo");
			request.setAttribute("url", request.getContextPath()+"/userQuestion.psj");
		}
	}

}
