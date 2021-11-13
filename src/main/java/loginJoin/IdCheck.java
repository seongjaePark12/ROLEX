package loginJoin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/IdCheck1")
public class IdCheck extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String mid = request.getParameter("mid")==null ? "" :request.getParameter("mid");
		
		LoginPDAO dao = new LoginPDAO();
		LoginPVO vo = dao.idCheck(mid);
		
		PrintWriter out = response.getWriter();
		
			if(vo.getMid() == null) {
				out.println("<script>");
				out.println("alert('중복되는 아이디가 있습니다');");
				out.println("location.href='"+request.getContextPath()+"/login/join.jsp'");
				out.println("</script>");
			}
			else {
				out.println("<script>");
				out.println("alert('사용가능한 아이디입니다');");
				out.println("location.href='"+request.getContextPath()+"/login/join.jsp'");
				out.println("</script>");
			}
	}
}
