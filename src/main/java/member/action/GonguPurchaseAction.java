package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import member.svc.GonguPurchaseService;
import vo.ActionForward;
import vo.Gongu;
import vo.Member;

public class GonguPurchaseAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		int gongu_id = Integer.parseInt(request.getParameter("gongu_id"));
		String member_id = (String)session.getAttribute("member_id");
		GonguPurchaseService gonguPurchaseService = new GonguPurchaseService();
		
		Gongu gongu = gonguPurchaseService.purchaseGongu(gongu_id);
		Member member = gonguPurchaseService.purchaseMember(member_id);
		
		if(gongu!=null) {
			request.setAttribute("gongu", gongu);
		}
		
		if(member!=null) {
			request.setAttribute("member", member);
		}
		forward = new ActionForward("/member/memberOrderForm.jsp", false);
		
		return forward;
	}

}
