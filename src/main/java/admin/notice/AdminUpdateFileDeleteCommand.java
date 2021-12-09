package admin.notice;

import java.io.IOException;
import java.io.File;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;
import dao.NoticeDAO;

public class AdminUpdateFileDeleteCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		String fSName = request.getParameter("fSName");
		
		String realPath = request.getServletContext().getRealPath("/data/notice/");
		
		File file = new File(realPath + fSName);
		
		if(file.exists()) {
			file.delete();		// 서버의 파일시스템에서 생성된 객체파일이 삭제된다(실제파일삭제)
		}
		NoticeDAO dao = new NoticeDAO();
		dao.updateFileDelete(idx);
		
		response.getWriter().write("pdsDeleteOk");
	}

}
