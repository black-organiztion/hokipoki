package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import delivery.svc.DeliveryGetService;
import member.svc.MyInfoService;
import vo.ActionForward;
import vo.Delivery;
import vo.Member;

public class MyInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	ActionForward forward=  null;
	Member member = null;
	Delivery delivery = null;
	try {
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("member_id");
		System.out.println("MyInfoAction에 들어온 session id:"+id);
		MyInfoService myInfoService = new MyInfoService();
		member  = myInfoService.showMyInfo(id);	
		DeliveryGetService deliveryGetService = new DeliveryGetService();
		delivery = deliveryGetService.getDelivery(id);
		
		
		if(member!=null) {
			request.setAttribute("member", member);			
		}
		if(delivery!=null) {			
			request.setAttribute("delivery", delivery);
		}
		
		request.setAttribute("pagefile", "/member/myInfo.jsp");
		forward = new ActionForward("./index.jsp", false);
		
		
	}catch(Exception e) {
		System.out.println("myInfoAction에서 오류");
		e.printStackTrace();
	}
	
	return forward;
	}

}
