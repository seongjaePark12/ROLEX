package loginJoin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/JoinP")
public class JoinP extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String mid = request.getParameter("mid")==null ? "": request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "": request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "": request.getParameter("name");
		String birth = request.getParameter("birth")==null ? "": request.getParameter("birth");
		String mm = request.getParameter("mm")==null ? "": request.getParameter("mm");
		String dd = request.getParameter("dd")==null ? "": request.getParameter("dd");
		String gender = request.getParameter("gender")==null ? "": request.getParameter("gender");
		String email = request.getParameter("email")==null ? "": request.getParameter("email");
		String email2 = request.getParameter("email2")==null ? "": request.getParameter("email2");
		String getCode = request.getParameter("getCode")==null ? "": request.getParameter("getCode");
		String getCode2 = request.getParameter("getCode2")==null ? "": request.getParameter("getCode2");
		String getCode3 = request.getParameter("getCode3")==null ? "": request.getParameter("getCode3");
		
		LoginPVO vo = new LoginPVO();
		LoginPDAO dao = new LoginPDAO();
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setBirth(birth+"-"+mm+"-"+dd);
		vo.setGender(gender);
		vo.setEmail(email+"@"+email2);
		vo.setGetCode(getCode+"-"+getCode2+"-"+getCode3);
		
		PrintWriter out = response.getWriter(); 
		int res = dao.joinP(vo);
		if(res == 1) {
			out.println("<script>");
			out.println("alert('회원가입완료');");
			out.println("location.href='"+request.getContextPath()+"/login/Main2.jsp';");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('회원가입 실패');");
			out.println("location.href='"+request.getContextPath()+"/login/join.jsp';");
			out.println("</script>");
		}
	}
}
