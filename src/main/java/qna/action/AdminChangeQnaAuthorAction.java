package qna.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import qna.svc.AdminChangeQnaAuthorService;
import vo.ActionForward;

public class AdminChangeQnaAuthorAction implements Action {

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
			//파라미터
			String loginId = (String)session.getAttribute("loginId");
			int loginAuthor = (int)session.getAttribute("loginAuthor");
			int qna_id = Integer.parseInt(request.getParameter("qna_id"));
			int qna_category = Integer.parseInt(request.getParameter("qna_category"));
			
			//서비스
			AdminChangeQnaAuthorService adminChangeQnaAuthorService = new AdminChangeQnaAuthorService();
			
			boolean isChangeAuthor = false;
			isChangeAuthor = adminChangeQnaAuthorService.changeAuthor(qna_id);
			
			if(isChangeAuthor) {
				
				forward = new ActionForward("adminQnaDetailViewAction.ad?qna_id="+qna_id+"&qna_category="+qna_category+"&alert=exist", true);
				
			}else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('답변넘기기 오류가 발생했습니다. 다시 시도해주세요');");
				out.print("history.back();");
				out.print("</script>");
			}
		}
		
		return forward;
	}

}
