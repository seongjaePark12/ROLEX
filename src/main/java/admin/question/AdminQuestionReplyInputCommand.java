package admin.question;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;
import dao.QuestionDAO;
import vo.ReplyQuestionVO;

public class AdminQuestionReplyInputCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int questionIdx = request.getParameter("questionIdx")==null? 0 : Integer.parseInt(request.getParameter("questionIdx"));
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		
		ReplyQuestionVO replyVO = new ReplyQuestionVO();
		replyVO.setQuestionIdx(questionIdx);
		replyVO.setMid(mid);
		replyVO.setHostIp(hostIp);
		replyVO.setContent(content);
		QuestionDAO dao = new QuestionDAO();
		dao.replyInput(replyVO);

	}

}
