package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import member.svc.MemberIdCheckService;
import vo.ActionForward;

public class MemberIdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
	
		String id = request.getParameter("id");
		
		boolean result=false;
		MemberIdCheckService memberIdCheckService = new MemberIdCheckService();
		result=memberIdCheckService.idChk(id);
	
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(result) out.println("0");
		else out.println("1");
		
		out.close();
		
		return forward;
	}

}
