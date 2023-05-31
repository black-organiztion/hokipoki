package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import member.svc.MemberGetService;
import vo.ActionForward;
import vo.Member;

public class QnAAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("member_id");
		MemberGetService memberGetService = new MemberGetService();
		
		Member member = memberGetService.getMember(id);
		if(member!=null) {
			request.setAttribute("member", member);
		}
		
		
		forward=new ActionForward("/index.jsp", false);
		request.setAttribute("pagefile", "/member/memberRecentOrder.jsp");
		request.setAttribute("infofile", "QnAForm");
		return forward;
		
		
	}

}
