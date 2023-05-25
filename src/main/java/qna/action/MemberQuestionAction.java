package qna.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import qna.svc.MemberQuestionService;
import vo.ActionForward;
import vo.Qna;

public class MemberQuestionAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		
		//로그인체크
		if(session.getAttribute("member_id") == null || session.getAttribute("member_id").equals("")) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='memberLogin.me';");
			out.println("</script>");
			
		}else {
			String saveFolder = "/member/qnaFiles"; //넘어오는 이미지 파일 저장경로
			String encoding = "utf-8";
			int maxSize = 10*1024*1024; //10MB
			
			String realFolder = request.getServletContext().getRealPath(saveFolder);
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encoding, new DefaultFileRenamePolicy());
			
			
			String member_id = (String)session.getAttribute("member_id");
			
			//qna 객체 생성
			Qna qna = new Qna();
			
			//set~
			qna.setQna_category(Integer.parseInt(multi.getParameter("qna_category"))); //카테고리
			
			System.out.println(qna.getQna_category());
			//문의권한
			if(qna.getQna_category() < 10) {
				qna.setQna_author(1);
			}else {
				qna.setQna_author(0);
			}
			System.out.println(qna.getQna_author());
			
			qna.setQna_subject(multi.getParameter("qna_subject"));//제목
			System.out.println(qna.getQna_subject());
			qna.setQna_content(multi.getParameter("qna_content"));//내용
			System.out.println(qna.getQna_content());
			qna.setMember_id(member_id);//멤버id(작성자)
			System.out.println(qna.getMember_id());
			
			//파일 : 첨부파일 있으면
			if(multi.getParameter("qna_file") == null || multi.getParameter("qna_file").equals("")) {
				
			}else {
				qna.setQna_file(multi.getParameter("qna_file"));
				System.out.println(qna.getQna_file());
			}

			//gongu_id 있으면
			if(multi.getParameter("gongu_id")==null || multi.getParameter("gongu_id").equals("")) {
				
			}else {
				qna.setGongu_id(Integer.parseInt(multi.getParameter("gongu_id")));
				System.out.println(qna.getGongu_id());
			}

			//order_id 있으면
			if(multi.getParameter("order_id")==null || multi.getParameter("order_id").equals("")) {
				
			}else {
				qna.setOrder_id(Integer.parseInt(multi.getParameter("order_id")));
				System.out.println(qna.getOrder_id());
			}
			
			
			
			//서비스생성
			MemberQuestionService memberQuestionService = new MemberQuestionService();
			
			boolean isRegistSuccess = false;
			
			isRegistSuccess = memberQuestionService.registQuestion(qna);
			
			if(isRegistSuccess) {
				forward = new ActionForward("/qnaListAction.qu",false);
				
			}else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('문의등록 오류가 발생했습니다. 다시 시도해주세요.');");
				out.println("history.back();");
				out.println("</script>");
			}
			
		}
		
		
		
		
		
		
		
		
		return forward;
	}

}
