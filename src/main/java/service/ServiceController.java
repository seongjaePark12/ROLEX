package service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@SuppressWarnings("serial")
@WebServlet("*.ser")
public class ServiceController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ServiceInterface command = null;
		String viewPage = "";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		if(com.equals("/serviceMap")){
			viewPage = "/WEB-INF/service/serviceMap.jsp";
		}
		else if(com.equals("/service")) {
			viewPage = "/WEB-INF/service/service.jsp";
		}
		else if(com.equals("/service1")) {
			viewPage = "/WEB-INF/service/service1.jsp";
		}
		else if(com.equals("/service2")) {
			viewPage = "/WEB-INF/service/service2.jsp";
		}
		else if(com.equals("/care")) {
			viewPage = "/WEB-INF/service/care.jsp";
		}


		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
