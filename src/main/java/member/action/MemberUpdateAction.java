package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import delivery.svc.InsertDeliveryService;
import delivery.svc.UpdateDeliveryService;
import vo.ActionForward;
import vo.Delivery;

public class MemberUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		boolean flag = false;
		Delivery delivery = new Delivery();
		String id = (String)session.getAttribute("member_id");
		System.out.println("delivery_id:"+request.getParameter("delivery_id"));
		
		delivery.setMember_id(id);
		delivery.setDelivery_id(request.getParameter("delivery_id"));
		delivery.setAddr1(request.getParameter("addr1"));
		delivery.setAddr2(request.getParameter("addr2"));
		delivery.setDelivery_name(request.getParameter("deliveryname"));
		delivery.setReceiver_name(request.getParameter("receivername"));
		delivery.setReceiver_tel(request.getParameter("receiver_tel"));
		delivery.setReceiver_tel2(request.getParameter("receiver_tel2"));
		delivery.setZip_code(request.getParameter("zip_code"));
		delivery.setIsdefault("1");


		UpdateDeliveryService updateDeliveryService = new UpdateDeliveryService();
		flag = updateDeliveryService.updateDelivery(delivery);
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
