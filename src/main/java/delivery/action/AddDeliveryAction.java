package delivery.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import delivery.svc.InsertDeliveryService;
import vo.ActionForward;
import vo.Delivery;

public class AddDeliveryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		boolean flag = false;
		Delivery delivery = new Delivery();
		String id = (String)session.getAttribute("member_id");
		
		
		String gongu_id = request.getParameter("gognu_id");
		
		delivery.setMember_id(id);
		delivery.setAddr1(request.getParameter("addr1"));
		delivery.setAddr2(request.getParameter("addr2"));
		delivery.setDelivery_name(request.getParameter("deliveryname"));
		delivery.setReceiver_name(request.getParameter("receivername"));
		delivery.setReceiver_tel(request.getParameter("tel1.1")+request.getParameter("tel1.2")+request.getParameter("tel1.3"));
		delivery.setReceiver_tel2(request.getParameter("tel2.1")+request.getParameter("tel2.2")+request.getParameter("tel2.3"));
		delivery.setZip_code(request.getParameter("zipcode"));
		delivery.setIsdefault("0");

		System.out.println(delivery);
			
		InsertDeliveryService insertDeliveryService = new InsertDeliveryService();
		flag = insertDeliveryService.insertDelivery(delivery);
		System.out.println("flag:"+flag);
		if(flag) {
			session.setAttribute("delivery", delivery);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");			
			out.println("history.back()");
			out.println("</script>");			
		}
		
		
		
		
		return forward;
	}

}
