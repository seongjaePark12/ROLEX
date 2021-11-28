package user.notice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NoticeDAO;
import user.UserInterface;
import vo.NoticeVO;

public class UserNoticeContentCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		int lately = request.getParameter("lately")==null? 0 : Integer.parseInt(request.getParameter("lately"));
		
		// 검색폼에서 값이 넘어 올경우 
		String sw = request.getParameter("sw")==null ? "" : request.getParameter("sw");
		request.setAttribute("sw", sw);
		
		NoticeDAO dao = new NoticeDAO();
		
		// 조회수 증가처리(조회수 중복방지)
		// 세션배열(객체배열:ArrayList()) : 고유세션아이디 + 'notice' + '현재글의 고유번호'
		HttpSession session = request.getSession();
		@SuppressWarnings({ "unchecked", "rawtypes" })
		ArrayList<String> contentIdx = (ArrayList)session.getAttribute("sContentIdx"); 
		if(contentIdx == null) {
			contentIdx = new ArrayList<String>();
			session.setAttribute("sContentIdx", contentIdx);
		}
		String imsiContentIdx = session.getId() + "notice" + idx;
		if(!contentIdx.contains(imsiContentIdx)) {
			dao.setReadNum(idx);
			contentIdx.add(imsiContentIdx);
		}
		
		NoticeVO vo = dao.getNoticeContent(idx);		// vo : 현재글을 저장
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("lately", lately);
		
		//'이전글(preVO)'/'다음글(nextVO)' 처리하기
		NoticeVO preVO = dao.preNextSearch("pre",idx);		// 이전글처리
		NoticeVO nextVO = dao.preNextSearch("next",idx);		// 다음글처리
		request.setAttribute("preVO", preVO);
		request.setAttribute("nextVO", nextVO);

	}

}
