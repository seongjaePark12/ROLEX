package admin.list;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;
import dao.AdminDAO;
import dao.QuestionDAO;

public class AdminPageCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		AdminDAO adminDAO = new AdminDAO();
		
		int newUser = adminDAO.getNewUser();
		request.setAttribute("newUser", newUser);
		
		QuestionDAO questiondao = new QuestionDAO();
		int totRecCnt = questiondao.totRecCnt();
		request.setAttribute("totRecCnt", totRecCnt);
		
	}
}
