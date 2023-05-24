package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import member.svc.PwChkService;
import vo.ActionForward;

public class PwChkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean pwflag=false;
		HttpSession session = request.getSession();
		String pw = request.getParameter("pw");
		String id = (String)session.getAttribute("member_id");
		PwChkService pwChkService = new PwChkService();
		pwflag = pwChkService.PwChk(pw, id);
		
		if(pwflag) {
			forward = new ActionForward("/myPage.me", false);
		}else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호를 다시 입력해주세요.')");
			out.println("history.back();");
			out.println("</script>");
			
		}
		
		
		return forward;
	}

}
