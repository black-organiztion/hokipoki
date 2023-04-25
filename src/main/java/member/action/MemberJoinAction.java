package member.action;

import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import member.svc.MemberJoinService;
import vo.ActionForward;
import vo.Member;

public class MemberJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		Member member = new Member();
		boolean joinResult=false;	
		
		member.setMember_id(request.getParameter("id"));
		member.setMember_pw(request.getParameter("pw"));
		member.setMember_name(request.getParameter("name"));
		member.setMember_tel(request.getParameter("tel"));
		member.setMember_email(request.getParameter("email"));
		member.setRecommend_id(request.getParameter("recommend_id"));
		member.setMembership_id(request.getParameter("membership_id"));	
		
		
		MemberJoinService memberJoinService = new MemberJoinService();
		joinResult=memberJoinService.joinMember(member);
		
		if(joinResult == false) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('회원등록 실패')");
			out.print("history.back()");
			out.print("</script>");
			
		}else {
			forward =new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./member/memberloginForm.jsp");			
		}		
		
		return forward;
	}

}
