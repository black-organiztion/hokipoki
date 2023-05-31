package qna.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import member.svc.MemberGetService;
import qna.svc.MemberQnAListService;
import vo.ActionForward;
import vo.Member;
import vo.QnA;

public class MemberQnAListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String member_id=(String)session.getAttribute("member_id");
		ArrayList<QnA> QnAList = null;
		MemberGetService mgservice = new MemberGetService();
		Member member = null;
		
		member = mgservice.getMember(member_id);
		MemberQnAListService memberQnAListService = new MemberQnAListService();
		QnAList = memberQnAListService.getMemberQnAList(member_id);
		request.setAttribute("member", member);
		if(QnAList != null) {
			request.setAttribute("QnAList", QnAList);
		}
		request.setAttribute("pagefile","member/memberRecentOrder.jsp");
		request.setAttribute("infofile", "QnAList");
		forward = new ActionForward("./index.jsp", false);
		return forward;
	}

}
