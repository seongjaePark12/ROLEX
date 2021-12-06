package user;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;
import dao.UserDAO;
import vo.UserVO;

public class UserLoginCheckCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = request.getParameter("mid")==null ? "" :request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" :request.getParameter("pwd");
		
		
		UserDAO dao = new UserDAO();
		UserVO vo = dao.userLogin(mid);
		
		
		if(vo != null) {  // 아이디 검색은 성공... 비밀번호가 맞는지 체크?.....
			SecurityUtil securityUtil = new SecurityUtil();
			pwd = securityUtil.encryptSHA256(pwd);
			
			if(pwd.equals(vo.getPwd())) {  // 비밀번호 인증 OK!(정상 로그인 되었을때 처리부분)
				session.setAttribute("sMid", mid);
				session.setAttribute("sLevel", vo.getLevel());
				session.setAttribute("sName", vo.getName());
				
				session.setAttribute("sLastDate", vo.getLastDate().substring(0, vo.getLastDate().lastIndexOf(".")));  // 최종 접속일 알아오기
				//session.setAttribute("sPoint", vo.getPoint());				// 고객의 현재(로그인 전까지) 총 포인트
				
				// 오늘 방문횟수 5회까지만 포인트 10 누적처리한다.
				Date today = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String strToday = sdf.format(today);
				
				int todayCnt = 0, newPoint = 0;
				if(vo.getLastDate().substring(0, 10).equals(strToday)) {
					if(vo.getTodayCnt() >= 1) {  // 기존이 5번째 방문이었기에, 이번이 6번째 방문이 된다.
						newPoint = 0;
					}
					else {
						newPoint = 10;
					}
					todayCnt = vo.getTodayCnt() + 1;
				}
				else {
					todayCnt = 1;
					newPoint = 10;
				}
				
				// 앞에서 구한 todayCnt를 mid와 함께 넘겨서 갱신처리한다.
				dao.setLastDateUpdate(mid, newPoint, todayCnt);  // 신규 로그인시 수정항목(포인트, 방문수,등등..) 처리
				
				// 아이디에 대한 정보를 쿠키로 저장 유무 처리?
				String remember = request.getParameter("remember")==null ? "" : request.getParameter("remember");
				if(remember.equals("on")) {  // idCheck가 체크되어 있다면, cMid쿠키명으로 쿠키 저장한다.
					Cookie cookie = new Cookie("cMid", mid);
					cookie.setMaxAge(60*60*24*3);	// 쿠키의 만료시간을 3일로 정했다.(단위 '초')
					response.addCookie(cookie);
				}
				else {  // idCheck가 체크 해제되어 있다면, 저장된 cMid 쿠키명을 삭제처리
					Cookie[] cookies = request.getCookies();  // 기존에 저장되어 있는 현재 사이트의 쿠키를 불러와서 배열로 저장한다.
					for(int i=0; i<cookies.length; i++) {
						if(cookies[i].getName().equals("cMid")) {
							cookies[i].setMaxAge(0);	// 저장된 cMid 쿠키를 삭제한다.
							response.addCookie(cookies[i]);
							break;
						}
					}
				}
			  request.setAttribute("msg", "userLoginOk");
			  request.setAttribute("url", request.getContextPath()+"/userMain.psj");
			  request.setAttribute("val", vo.getMid());
			}
			else {
				request.setAttribute("msg", "userberLoginPwdNo");
				request.setAttribute("url", request.getContextPath()+"/userLogin.psj");
			}
		}
		else {
			request.setAttribute("msg", "userLoginNo");
			request.setAttribute("url", request.getContextPath()+"/userLogin.psj");
		}
	}
}
