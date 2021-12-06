package user.question;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QuestionDAO;
import user.UserInterface;
import vo.QuestionVO;

public class UserQuestionUpdateOkCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title")== null ? "" :request.getParameter("title");
		String what = request.getParameter("what")== null ? "" :request.getParameter("what");
		String content = request.getParameter("content")== null ? "" :request.getParameter("content");
		String hostIp = request.getParameter("hostIp")== null ? "" :request.getParameter("hostIp");
		int idx = request.getParameter("idx")== null ? 0 :Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		
		
		// title 필드에 태그사용금지 시킨다(< -> &lt; , > -> &gt;)
		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		
		QuestionVO vo = new QuestionVO();
		vo.setTitle(title);
		vo.setWhat(what);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		vo.setIdx(idx);
		
		QuestionDAO dao = new QuestionDAO();
		
		int res = dao.setQuestionUpdateOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "QuestionUpdateOk");
		}
		else {
			request.setAttribute("msg", "QuestionUpdateNo");
		}
		request.setAttribute("url", request.getContextPath()+"/userQuestion.psj?pag="+pag+"&pageSize="+pageSize);



	}

}
