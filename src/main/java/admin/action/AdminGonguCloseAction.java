package admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import admin.svc.AdminGonguSetStatusService;
import vo.ActionForward;
import vo.Gongu;

public class AdminGonguCloseAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
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
			
			AdminGonguSetStatusService adminGonguSetStatusService = new AdminGonguSetStatusService();
			
			ArrayList<Gongu> closeGonguList = adminGonguSetStatusService.closeGonguAll();
			
			String closeMsg = "";
			
			
			if(closeGonguList.size() > 0) {
				
			 for(int i=0; i<closeGonguList.size();i++) {
				   String gonguName = closeGonguList.get(i).getGongu_name();
				   closeMsg += gonguName + "\n";
			   }
				
				request.setAttribute("closeMsg", closeMsg);
				forward = new ActionForward("adminGonguListAction.ad?alert=close", false);
				
			}else if(closeGonguList.size() == 0){
				
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('오늘 종료될 공구가 없습니다.');");
				out.print("location.href='adminGonguListAction.ad';");
				out.print("</script>");
				
			}else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('공구일괄종료에 오류가 발생했습니다. 다시 시도해주세요.');");
				out.print("location.href='adminGonguListAction.ad';");
				out.print("</script>");
			}
			 
			
		}
		
		return forward;
	}

}
