package admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import admin.svc.AdminLoginService;
import admin.svc.AdminMyPageService;
import vo.ActionForward;
import vo.Seller;

public class AdminMyPageAction implements Action {

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
			
			//파라미터처리
			String loginId = (String)session.getAttribute("loginId");
			//int loginAuthor = (int)session.getAttribute("loginAuthor");
			
			//서비스 생성
			AdminMyPageService adminMyPageService = new AdminMyPageService();
			Seller seller = adminMyPageService.showMyInfo(loginId);
			
			if(seller == null) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('내정보 보기 오류가 발생했습니다. 다시 시도해주세요.');");
				out.print("history.back();");
				out.print("</script>");
				
			}else {
				request.setAttribute("seller",seller);
				request.setAttribute("pagefile", "/admin/adminMyPage.jsp");
		
				forward = new ActionForward("/admin/adminTemplate.jsp",false);
				
			}
			
		}
		
		return forward;
	}

}
