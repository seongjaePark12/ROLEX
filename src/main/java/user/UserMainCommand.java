package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserMainCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		
		// 회원 등급
			String strLevel = "";
			if(level == 0) strLevel = "관리자";
			else if(level == 1) strLevel = "WELCOME";
			else if(level == 2) strLevel = "BEIGE";
			else if(level == 3) strLevel = "RED";
			else if(level == 4) strLevel = "GOLD";
			else if(level == 5) strLevel = "BLACK";
			else if(level == 6) strLevel = "운영자";
			
			session.setAttribute("strLevel", strLevel);

	}

}
