package user.question;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QuestionDAO;
import user.UserInterface;
import vo.QuestionVO;
import vo.ReplyQuestionVO;

public class UserQuestionContentCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		int lately = request.getParameter("lately")==null? 0 : Integer.parseInt(request.getParameter("lately"));
		
		// 검색폼에서 값이 넘어 올경우 
		String sw = request.getParameter("sw")==null ? "" : request.getParameter("sw");
		request.setAttribute("sw", sw);
		
		QuestionDAO dao = new QuestionDAO();
		
		// 댓글 수정시에 처리부분
		int replyIdx = request.getParameter("replyIdx")==null ? 0 : Integer.parseInt(request.getParameter("replyIdx"));
		if(replyIdx != 0) {
			String replyContent = dao.getReply(replyIdx);
			request.setAttribute("replyIdx", replyIdx);
			request.setAttribute("replyContent", replyContent);
		}
		
		
		QuestionVO vo = dao.getQuestionContent(idx);		// vo : 현재글을 저장
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("lately", lately);
		
		//'이전글(preVO)'/'다음글(nextVO)' 처리하기
		QuestionVO preVO = dao.preNextSearch("pre",idx);		// 이전글처리
		QuestionVO nextVO = dao.preNextSearch("next",idx);		// 다음글처리
		request.setAttribute("preVO", preVO);
		request.setAttribute("nextVO", nextVO);
		
		//댓글 읽어오기
		List<ReplyQuestionVO> replyVOS = dao.getReplyQuestion(idx);
		request.setAttribute("replyVOS", replyVOS);
	}

}
