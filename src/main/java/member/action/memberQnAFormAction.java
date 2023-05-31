package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import member.svc.MemberGetService;
import vo.ActionForward;
import vo.Member;

public class memberQnAFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		MemberGetService membergetService = new MemberGetService();
		Member member = membergetService.getMember(member_id);
		
		request.setAttribute("member", member);
		request.setAttribute("pagefile", "/member/memberRecentOrder.jsp");
		request.setAttribute("infofile", "QnAForm");
    	 forward = new ActionForward("./index.jsp",false);
		
		
		
		return forward;
	}

}
