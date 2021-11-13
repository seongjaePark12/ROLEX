package loginJoin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/UserDel")
public class userDel extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		LoginPDAO dao = new LoginPDAO();
		boolean res = dao.loginDel(mid);
		PrintWriter out = response.getWriter();
		
		if(res) {
			out.println("<script>");
			out.println("alert('"+mid+"님 정상적으로 탈퇴 되셨습니다');");
			out.println("location.href='"+request.getContextPath()+"/login/Main.jsp';");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('"+mid+"님 탈퇴 취소 되셨습니다');");
			out.println("location.href='"+request.getContextPath()+"/login/Main2.jsp';");
			out.println("</script>");
		}
	}
}
