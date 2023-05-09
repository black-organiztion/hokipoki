package order.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import delivery.svc.ReturndeliveryIdService;
import gongu.svc.GonguReserveUpdateService;
import order.svc.MemberPaymentService;
import vo.ActionForward;
import vo.Delivery;

public class MemberPaymentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		boolean paymentflag = false;
		boolean reserveflag = false;
		Delivery delivery = null;
		int delivery_id = 0;
		String gongu_id = request.getParameter("gongu_id");
		String member_id = (String) session.getAttribute("member_id");
		System.out.println("member_id:"+member_id);
		
		
		String isdefault = request.getParameter("isdefault");
		System.out.println("deliveryisdefault:" + isdefault);
		
		if (isdefault.equals("0")) {
			delivery = new Delivery();
			delivery.setMember_id(member_id);
			delivery.setZip_code(request.getParameter("zip_code"));
			delivery.setAddr1(request.getParameter("addr1"));
			delivery.setAddr2(request.getParameter("addr2"));
			delivery.setDelivery_name(request.getParameter("delivery_name"));
			delivery.setReceiver_name(request.getParameter("receiver_name"));
			delivery.setReceiver_tel(
					request.getParameter("receiver_tel") );
			delivery.setReceiver_tel2(
					request.getParameter("receiver_tel2") );
			delivery.setIsdefault("0");
			ReturndeliveryIdService returndeliveryIdService = new ReturndeliveryIdService();
			delivery_id = returndeliveryIdService.returnDeliveryId(delivery);
			System.out.println("delivery_id if 안"+delivery_id);
			
		} else {
			delivery_id = Integer.parseInt(request.getParameter("delivery_id"));
			System.out.println("delivery_id else 안"+delivery_id);
		}

		MemberPaymentService memberPaymentService = new MemberPaymentService();
		GonguReserveUpdateService gonguReserveUpdateService = new GonguReserveUpdateService();

		reserveflag = gonguReserveUpdateService.updateReserve(gongu_id);
		paymentflag = memberPaymentService.paymentProcess(gongu_id, member_id, delivery_id);

		if (reserveflag && paymentflag) {
			return forward;
		} else {
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('결제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}

		return forward;
	}

}
