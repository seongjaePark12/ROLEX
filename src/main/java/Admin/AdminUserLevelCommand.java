package Admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AdminDAO;

public class AdminUserLevelCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		int level = Integer.parseInt(request.getParameter("level"));
		
		AdminDAO adminDAO = new AdminDAO();
		adminDAO.setUserLevelChange(idx, level);
		
		request.setAttribute("msg", "UserLevelChangeOk");
		request.setAttribute("url", request.getContextPath()+"/adminUserList.boss");

	}

}
