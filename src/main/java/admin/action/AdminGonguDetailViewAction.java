package admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import admin.svc.AdminGonguDetailViewService;
import admin.svc.AdminSellerViewSevice;
import gongu.svc.GonguViewService;
import vo.ActionForward;
import vo.Gongu;
import vo.Seller;

public class AdminGonguDetailViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		//파라미터 처리
		int gongu_id = Integer.parseInt(request.getParameter("gongu_id"));
		String seller_id = request.getParameter("seller_id");
		
		//기능1. 공구정보 불러오기
		//서비스 생성
		//Gongu gongu = GonguViewService.getGonguView(gongu_id);
		
		AdminGonguDetailViewService adminGonguDetailViewService = new AdminGonguDetailViewService();
		
		Gongu gongu = adminGonguDetailViewService.getGongu(gongu_id);
		
		
		//기능2. 판매자정보 불러오기
		AdminSellerViewSevice adminSellerViewSevice = new AdminSellerViewSevice(); 
		Seller seller = adminSellerViewSevice.getSellerView(seller_id);
		
		if(gongu!=null && seller!=null) {
			request.setAttribute("gongu", gongu);
			request.setAttribute("seller", seller);
			request.setAttribute("pagefile", "/admin/adminGonguDetailView.jsp");
			forward = new ActionForward("/admin/adminTemplate.jsp", false);
			
		}else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('공구상세보기 오류가 발생했습니다. 다시 시도해주세요.');");
			out.print("history.back();");
			out.print("</script>");
		}

		return forward;
	}

}
