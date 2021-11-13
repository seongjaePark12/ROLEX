package loginJoin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@SuppressWarnings("serial")
@WebServlet("/LoginCheck")
public class LoginP extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String mid = request.getParameter("mid")==null ? "" :request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" :request.getParameter("pwd");
		String remember = request.getParameter("remember");
		
		LoginPDAO dao = new LoginPDAO();
		LoginPVO vo = dao.loginCheck(mid, pwd);
		PrintWriter out = response.getWriter();
	
		if(vo.getName() == null) {
			// 자료를 못찾음.
			out.println("<script>");
			out.println("alert('아이디와 비밀번호를 확인해주세요');");
			out.println("location.href='"+request.getContextPath()+"/login/Login.jsp'");
			out.println("</script>");
		}
		else {
			// 정상적으로 로그인 된 경우이다.
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());
			
			// 방문횟수를 DB에 1 증가 시켜준다(1회 방문시 50point 지급한다)
			// 1일 5회 이상 방문시는 방문 point를 주지 않는다
			dao.PointUpdate(mid);
			dao.vCountUpdate(mid);
			if(remember != null){
				// 쿠키에 아이디 저장유무 처리 할것
	      Cookie cookie = new Cookie("cMid", mid);
	      cookie.setMaxAge(60*60);
	      response.addCookie(cookie);
	      out.println("<script>");
	    	out.println("alert('"+vo.getMid()+"님 로그인되셨습니다.\\n최근 접속일: "+vo.getLastDate()+"');");
				out.println("location.href='"+request.getContextPath()+"/login/Main2.jsp?vCount="+vo.getvCount()+"';");
	      out.println("</script>"); 
			} else{
	      out.println("<script>");
	    	out.println("alert('"+vo.getMid()+"님 로그인되셨습니다.\\n최근 접속일: "+vo.getLastDate()+"');");
				out.println("location.href='"+request.getContextPath()+"/login/Main2.jsp?vCount="+vo.getvCount()+"';");
	      out.println("</script>");  
			}
		}
	}
}
