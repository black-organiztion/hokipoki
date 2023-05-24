package member.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import delivery.svc.DeliveryGetService;
import member.svc.MyInfoService;
import order.svc.RecentOrderListService;
import vo.ActionForward;
import vo.Delivery;
import vo.Member;
import vo.MemberOrderGongu;

public class MyPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=  null;
		Member member = null;
		Delivery delivery = null;
		ArrayList<MemberOrderGongu> recentOrderList = null;
		try {
			HttpSession session = request.getSession();
			
			String id = (String)session.getAttribute("member_id");
			MyInfoService myInfoService = new MyInfoService();
			member  = myInfoService.showMyInfo(id);	
			DeliveryGetService deliveryGetService = new DeliveryGetService();
			delivery = deliveryGetService.getDelivery(id);
			RecentOrderListService recentOrderListService = new RecentOrderListService();
			recentOrderList = recentOrderListService.getRecentOrderList(id);
			
			if(recentOrderList  != null) {
				request.setAttribute("orderList", recentOrderList);
			}
			if(member!=null) {
				request.setAttribute("member", member);			
			}
			if(delivery!=null) {			
				request.setAttribute("delivery", delivery);
			}
			
			request.setAttribute("pagefile", "/member/memberRecentOrder.jsp");
			forward = new ActionForward("./index.jsp", false);
			
			
		}catch(Exception e) {
			System.out.println("myInfoAction에서 오류");
			e.printStackTrace();
		}
		
		return forward;
		}
		
	

}
