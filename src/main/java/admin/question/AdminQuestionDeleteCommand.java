package admin.question;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;
import dao.QuestionDAO;

public class AdminQuestionDeleteCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));

		QuestionDAO dao = new QuestionDAO();
		
		int res = dao.setQuestionDelete(idx);
		
		if(res == 1) {
			request.setAttribute("msg", "QuestionDeleteOk");
			request.setAttribute("url", request.getContextPath()+"/adminQuestion.boss?pag="+pag+"&pageSize="+pageSize);
		}
		else {
			request.setAttribute("msg", "QuestionDeleteNo");
			request.setAttribute("url", request.getContextPath()+"/adminQuestionContent.boss?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		}

	}

}
