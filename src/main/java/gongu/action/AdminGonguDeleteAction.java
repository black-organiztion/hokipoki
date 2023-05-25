package gongu.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import gongu.svc.AdminGonguDeleteService;
import vo.ActionForward;

public class AdminGonguDeleteAction implements Action {

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
			
			String loginId = (String)session.getAttribute("loginId");
			int loginAuthor = (int)session.getAttribute("loginAuthor");
			String gongu_id = request.getParameter("gongu_id");
			
			AdminGonguDeleteService adminGonguDeleteService = new AdminGonguDeleteService();
			boolean isDeleteSuccess = false;
			isDeleteSuccess = adminGonguDeleteService.deleteGongu(gongu_id);
			
			if(isDeleteSuccess) {
	    		forward = new ActionForward("/adminGonguListAction.ad", false);
	    		
			}else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('공구삭제 오류가 발생했습니다. 다시 시도해주세요');");
				out.print("history.back();");
				out.print("</script>");
			}
		}
		
		return forward;
	}

}
