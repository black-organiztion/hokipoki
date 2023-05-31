package admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import admin.svc.AdminLoginService;
import vo.ActionForward;
import vo.Seller;

public class AdminLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		//파라미터 처리
		String seller_id = request.getParameter("seller_id");
		String seller_pw = request.getParameter("seller_pw");
		
		
		if(seller_id == null) {
			forward = new ActionForward("./adminLogin.ad",true);
			
		}else{
			//서비스 생성
			AdminLoginService adminLoginService = new AdminLoginService();
			
			//기능) 로그인 및 seller 객체 가져오기
			//로그인 성공 체크
			
			Seller seller = adminLoginService.selectSeller(seller_id,seller_pw);
			
			//로그인 성공시
			if(seller != null) {
				
				HttpSession session = request.getSession();
				session.setMaxInactiveInterval(1800); //세션 30분 설정
				//세션에 id 남김
				session.setAttribute("loginId", seller.getSeller_id());
				session.setAttribute("loginAuthor", seller.getSeller_author());
				
				int seller_author = seller.getSeller_author();
				
				//권한 확인
				if(seller_author > 1) {//권한 99일 경우 -> 승인 대기 화면으로 이동
					forward = new ActionForward("./adminStandby.ad",true);
					
				}else {//권한 0||1일 경우 -> 관리자 홈으로 이동
					request.setAttribute("pagefile", "/admin/adminMain.jsp");
					forward = new ActionForward("/admin/adminTemplate.jsp",false);
				}
				
			}else {
				//로그인 실패
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('로그인에 실패하셨습니다. 다시 시도해주세요');");
				out.print("history.back();");
				out.print("</script>");
			}
			
			
			
		}

		return forward;
	}

}
