package admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import admin.svc.AdminJoinService;
import vo.ActionForward;
import vo.Seller;

public class AdminJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		//파라미터 처리
		String seller_id = request.getParameter("seller_id");
		String seller_pw = request.getParameter("seller_pw");
		String seller_name = request.getParameter("seller_name");
		String seller_number = request.getParameter("seller_number");
		
		//매개값으로 넘길 seller 객체 생성
		Seller seller = new Seller(seller_id, seller_pw, seller_name, seller_number, 99);
		
		//서비스
		AdminJoinService adminJoinService = new AdminJoinService();
		
		//가입성공체크
		boolean isJoinSuccess = adminJoinService.insertSeller(seller);
		
		if(isJoinSuccess) {
			//로그인 페이지로 이동
			forward = new ActionForward("adminLogin.ad?alert=exist",true);
			
			
		}else {
			//회원가입 실패
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('회원가입에 실패하셨습니다. 다시 시도해주세요');");
			out.print("history.back();");
			out.print("</script>");
			
		}
		
		
		return forward;
	}

}
