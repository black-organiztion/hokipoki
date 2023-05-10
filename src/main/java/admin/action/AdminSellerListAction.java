package admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import admin.svc.AdminSellerListService;
import vo.ActionForward;
import vo.Seller;

public class AdminSellerListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		int loginAuthor = (int)session.getAttribute("loginAuthor");
				
		//세션 로그인&권한체크
		if(loginId == null || loginAuthor!=0) {
			//로그인 이동
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('권한이 없습니다. 다시 로그인해주세요');");
			out.print("location.href='adminLogin.ad';");
			out.print("</script>");
			
		}else {//권한이 있다면
			
			//판매자 리스트 가져오기(정렬순서  99->1, 오름차순)
			AdminSellerListService adminSellerListService = new AdminSellerListService();
			
			ArrayList<Seller> sellerList = adminSellerListService.getSellerList();
			
			int standByCnt = 0;
			
			//가입대기건수
			for(int i=0; i<sellerList.size(); i++) {
				int author = sellerList.get(i).getSeller_author();
				
				if(author == 99) {
					standByCnt++;
				}
				
			}
			
			if(sellerList.size() > 0) {
				request.setAttribute("standByCnt", standByCnt);
				request.setAttribute("sellerList", sellerList);
				request.setAttribute("pagefile", "/admin/adminSellerConfig.jsp");
				forward = new ActionForward("/admin/adminTemplate.jsp",false);
			}
		}
		
		return forward;
	}

}
