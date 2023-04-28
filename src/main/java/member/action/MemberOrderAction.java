package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import member.svc.MemberOrderService;
import vo.ActionForward;

public class MemberOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		boolean result;
		
		
		String member_id = (String)session.getAttribute("member_id");
		String gongu_id = request.getParameter("gongu_id");
		
		MemberOrderService memberOrderService = new MemberOrderService();
		
		
		result = memberOrderService.insertOrder(member_id,gongu_id);
		
		
		
		return forward;
	}

}
