package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import member.svc.GonguPurchaseService;
import vo.ActionForward;
import vo.Delivery;
import vo.Gongu;
import vo.Member;

public class GonguPurchaseAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;

		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");

		if (member_id == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인해야 구매할 수 있는 상품입니다.');");
			out.println("history.back();");
			out.println("</script>");
		}else {
         
		int gongu_id = Integer.parseInt(request.getParameter("gongu_id"));

		String isdefault = request.getParameter("isdefault");

		GonguPurchaseService gonguPurchaseService = new GonguPurchaseService();

		Gongu gongu = gonguPurchaseService.purchaseGongu(gongu_id);
		Member member = gonguPurchaseService.purchaseMember(member_id);
		Delivery delivery = gonguPurchaseService.getDelivery(member_id, isdefault);
		if (gongu != null) {
			request.setAttribute("gongu", gongu);
		}

		if (member != null) {
			request.setAttribute("member", member);
		}

		if (delivery != null) {
			request.setAttribute("delivery", delivery);
		}

		
		  request.setAttribute("pagefile", "/member/memberOrderForm.jsp"); forward =
		  new ActionForward("./index.jsp", false);
		 
		
		}	 
		return forward;
	}

}
