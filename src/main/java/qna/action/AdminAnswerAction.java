package qna.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import qna.svc.AdminAnswerService;
import vo.ActionForward;

public class AdminAnswerAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		//파라미터처리
		HttpSession session = request.getSession();

		if(session.getAttribute("loginId")==null || session.getAttribute("loginId").equals("") || 
				session.getAttribute("loginAuthor") == null || (int)session.getAttribute("loginAuthor") > 1) {
			//로그인 이동
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('권한이 없습니다. 다시 로그인해주세요');");
			out.print("location.href='adminLogin.ad';");
			out.print("</script>");

		}else {
			int qna_id = Integer.parseInt(request.getParameter("qna_id"));
			String answer = request.getParameter("qna_a_content");
			int qna_category = Integer.parseInt(request.getParameter("qna_category"));
			String seller_id = request.getParameter("seller_id");
			
			AdminAnswerService adminAnswerService = new AdminAnswerService();
			
			boolean isAnswer = false;
			
			isAnswer = adminAnswerService.addAnswer(qna_id, answer, seller_id);
			
			if(isAnswer) {
				forward = new ActionForward("adminQnaDetailViewAction.ad?qna_id="+qna_id+"&qna_category="+qna_category, true);
				
			}else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('문의답변등록에 실패했습니다. 다시 시도해주세요');");
				out.print("history.back();");
				out.print("</script>");
			}
			
		}
		
		return forward;
	}

}
