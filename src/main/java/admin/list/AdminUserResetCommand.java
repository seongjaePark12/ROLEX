package admin.list;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;
import dao.AdminDAO;

public class AdminUserResetCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		AdminDAO dao = new AdminDAO();

		dao.setUserReset(idx);
		
		request.setAttribute("msg", "UserResetOk");
		request.setAttribute("url", request.getContextPath()+"/adminUserList.boss");
	}

}
