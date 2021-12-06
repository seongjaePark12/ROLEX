package webMessage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WmDeleteCheckCommand implements WebMassageInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String mFlag = request.getParameter("mFlag")==null? "" : request.getParameter("mFlag");
			int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
			
			WebMessageDAO dao = new WebMessageDAO();
			int res = dao.wmDeleteCheck(idx,mFlag);
			
			if(res == 1) {
				request.setAttribute("msg", "wmDeleteOk");
			}
			else {
				request.setAttribute("msg", "wmDeleteNo");
			}
			request.setAttribute("url", request.getContextPath()+"/wmMessage.wm");
	}

}
