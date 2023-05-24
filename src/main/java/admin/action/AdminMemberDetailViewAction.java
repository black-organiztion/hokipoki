package admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import admin.svc.AdminMemberOrderListService;
import delivery.svc.DeliveryGetService;
import member.svc.MyInfoService;
import vo.ActionForward;
import vo.Delivery;
import vo.Member;
import vo.MemberOrder;

public class AdminMemberDetailViewAction implements Action {

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
			String member_id = request.getParameter("member_id");
					
			//기능1. 회원정보가져오기
			MyInfoService myInfoService = new MyInfoService();
			Member member  = myInfoService.showMyInfo(member_id);	

			//기능2. 회원구매정보가져오기
			AdminMemberOrderListService adminMemberOrderListService = new AdminMemberOrderListService();
			ArrayList<MemberOrder> memberOrderList = adminMemberOrderListService.getMemberOrderList(member_id);
			
			//기능3. 회원구매금액총합 계산
			int totalBuyPrice = 0;
			for(int i=0; i<memberOrderList.size(); i++) {
				int buyPrice = memberOrderList.get(i).getOrder_price();
				totalBuyPrice += buyPrice;
			}
			
			//기능4. 회원배송지가져오기
			DeliveryGetService deliveryGetService = new DeliveryGetService();
			ArrayList<Delivery>deliveryList = deliveryGetService.getDeliveryList(member_id);
			
			
			if(member == null) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('회원상세보기 오류가 발생했습니다. 다시 시도해주세요.');");
				out.print("history.back();");
				out.print("</script>");
				
			}else {
				request.setAttribute("member",member);
				request.setAttribute("buyList",memberOrderList);
				request.setAttribute("totalBuyPrice", totalBuyPrice);
				request.setAttribute("deliveryList", deliveryList);
				request.setAttribute("pagefile", "/admin/adminMemberDetailView.jsp");
				
				forward = new ActionForward("/admin/adminTemplate.jsp",false);
			}
			
			
		}
		

		return forward;
	}

}
