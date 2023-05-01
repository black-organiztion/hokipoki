package order.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import gongu.svc.GonguReserveUpdateService;
import order.svc.MemberPaymentService;
import vo.ActionForward;

public class MemberPaymentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean paymentflag = false;
		boolean reserveflag = false;
		
		String gongu_id = request.getParameter("gongu_id");
		String member_id = request.getParameter("member_id");
		String delivery_id = request.getParameter("delivery_id");
		
		MemberPaymentService memberPaymentService = new MemberPaymentService();
		GonguReserveUpdateService gonguReserveUpdateService = new GonguReserveUpdateService();
		
		reserveflag = gonguReserveUpdateService.updateReserve(gongu_id);		
		paymentflag = memberPaymentService.paymentProcess(gongu_id,member_id,delivery_id);
		
		if(reserveflag && paymentflag) {
			return forward;
		}
		
		
		return forward;
	}

}
