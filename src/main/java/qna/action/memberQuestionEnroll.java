package qna.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import qna.service.QuestionEnrollService;
import vo.ActionForward;
import vo.QnA;

public class memberQuestionEnroll implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String saveFolder = "/member/qnaFiles";//넘어오는 이미지 파일 저장 경로
		String encoding = "utf-8";
		int maxSize = 10*1024*1024; //10MB		
		
		String realFolder = 
				request.getServletContext().getRealPath(saveFolder);
		System.out.println("realFolder"+realFolder);
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String member_id = (String)session.getAttribute("member_id");
		
		QnA qna = new QnA();
		
		qna.setQnA_files(multi.getFilesystemName("qna_file"));
		qna.setMember_id(member_id);
		qna.setQnA_category(multi.getParameter("qna_subject"));
		qna.setQnA_subject(multi.getParameter("qna_subject"));
		qna.setQnA_contents(multi.getParameter("qna_content"));
		
		QuestionEnrollService questionEnrollService = new QuestionEnrollService();
		int enrollChk = questionEnrollService.qnaInsert(qna);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(enrollChk>0) {
			out.println("<script>");
			out.println("alert('등록완료');");
			out.println("location.href='member/qnaList.qu';");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('등록실패');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		
		return forward;
		
		
	}

	

}
