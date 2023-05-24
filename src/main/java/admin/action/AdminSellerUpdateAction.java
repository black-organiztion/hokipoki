package admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import admin.svc.AdminSellerUpdateService;
import vo.ActionForward;
import vo.Seller;

public class AdminSellerUpdateAction implements Action {

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
			
			String seller_id = request.getParameter("seller_id");
			String seller_pw = request.getParameter("seller_pw");
			String seller_name = request.getParameter("seller_name");
			String seller_number = request.getParameter("seller_number");
			
			Seller seller = new Seller();
			seller.setSeller_id(seller_id);
			seller.setSeller_pw(seller_pw);
			seller.setSeller_name(seller_name);
			seller.setSeller_number(seller_number);
			
			//서비스 생성
			AdminSellerUpdateService adminSellerUpdateService = new AdminSellerUpdateService(); 
			//업데이트성공여부
			boolean isUpdateSuccess = false;
			isUpdateSuccess = adminSellerUpdateService.modifySeller(seller);
			
			if(isUpdateSuccess) {
				forward = new ActionForward("/adminMyPage.ad",false);
				
			}else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('내정보 수정 오류가 발생했습니다. 다시 시도해주세요');");
				out.print("history.back();");
				out.print("</script>");
			}
			
		}
		
		return forward;
	}

}
