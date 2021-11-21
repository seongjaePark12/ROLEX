package Admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AdminDAO;
import VO.UserVO;

public class AdminUserInforCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		AdminDAO dao = new AdminDAO();
		
		UserVO vo = dao.getUserInfor(idx);
		
		request.setAttribute("vo", vo);
	}

}
