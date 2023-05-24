package admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import admin.svc.AdminSellerJoinCheckService;
import admin.svc.AdminSellerListService;
import vo.ActionForward;
import vo.Seller;

public class AdminSellerJoinCheckAction implements Action {

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
			//String loginId = (String)session.getAttribute("loginId");
			//int loginAuthor = (int)session.getAttribute("loginAuthor");
			
			//파라미터 처리
			String seller_id = request.getParameter("seller_id");
			
			//서비스 생성
			AdminSellerJoinCheckService adminSellerJoinCheckService = new AdminSellerJoinCheckService();
			
			//회원가입 체크 여부
			boolean isCheckSuccess = false;
			isCheckSuccess = adminSellerJoinCheckService.setAuthor(seller_id);
			
			if(isCheckSuccess) {
				forward = new ActionForward("adminSellerListAction.ad",true);
			}else {
				//회원가입 승인 실패
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('판매자 회원가입 승인에 실패하였습니다. 다시 시도해주세요');");
				out.print("/adminSellerListAction.ad");
				out.print("</script>");
			}
		}
		
		
		
		return forward;
	}

}
