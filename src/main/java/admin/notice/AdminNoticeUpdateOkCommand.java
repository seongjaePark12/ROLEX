package admin.notice;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.AdminInterface;
import dao.NoticeDAO;
import vo.NoticeVO;

public class AdminNoticeUpdateOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파일처리 시작
		String realPath = request.getServletContext().getRealPath("/data/notice/");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		// 파일 업로드 처리 완료
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		//업로드된 파일의 정보를 DB에 처리하기위한 작업
		@SuppressWarnings("rawtypes")
		Enumeration fileNames = multipartRequest.getFileNames();
		
		String originalFileName = "";
		String filesystemName = "";
		while(fileNames.hasMoreElements()) {
			String file = (String) fileNames.nextElement();
			
			if(multipartRequest.getOriginalFileName(file) != null) {
				originalFileName += multipartRequest.getOriginalFileName(file)+"/";
				filesystemName += multipartRequest.getFilesystemName(file)+"/";
			}
		}
		if(!originalFileName.equals("")) {
			originalFileName = originalFileName.substring(0,originalFileName.length()-1);
			filesystemName = filesystemName.substring(0,filesystemName.length()-1);
		}
		int fileSize = multipartRequest.getParameter("fileSize")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("fileSize"));
		// 파일처리 끝 
		String title = multipartRequest.getParameter("title")== null ? "" :multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content")== null ? "" :multipartRequest.getParameter("content");
		String hostIp = multipartRequest.getParameter("hostIp")== null ? "" :multipartRequest.getParameter("hostIp");
		String fSName = multipartRequest.getParameter("fSName")== null ? "" :multipartRequest.getParameter("fSName");
		int idx = multipartRequest.getParameter("idx")== null ? 0 :Integer.parseInt(multipartRequest.getParameter("idx"));
		int pag = multipartRequest.getParameter("pag")==null ? 1 : Integer.parseInt(multipartRequest.getParameter("pag"));
		int pageSize = multipartRequest.getParameter("pageSize")==null ? 5 : Integer.parseInt(multipartRequest.getParameter("pageSize"));
		
		
		// title 필드에 태그사용금지 시킨다(< -> &lt; , > -> &gt;)
		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		
		NoticeVO vo = new NoticeVO();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		vo.setIdx(idx);
		if(originalFileName.equals("")) {
			vo.setfName(fSName);
			vo.setfSName(fSName);
		}
		else {
			File file = new File(realPath + fSName);
			if(file.exists()) file.delete();		// 서버의 파일시스템에서 생성된 객체파일이 삭제된다(실제파일삭제)
			
			vo.setfName(originalFileName);
			vo.setfSName(filesystemName);
		}
		vo.setfSize(fileSize);
		
		NoticeDAO dao = new NoticeDAO();
		
		int res = dao.setNoticeUpdateOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "noticeUpdateOk");
		}
		else {
			request.setAttribute("msg", "noticeUpdateNo");
		}
		request.setAttribute("url", request.getContextPath()+"/adminNotice.boss?pag="+pag+"&pageSize="+pageSize);

	}

}
