package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import member.svc.IdCheckService;
import vo.ActionForward;

public class RecommendCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
    	boolean flag =false;
    	
    	String id =request.getParameter("id");
    	
    	IdCheckService idCheckService = new IdCheckService();
    	
    	flag = idCheckService.dupCheck(id);
    	System.out.println(flag);
    	if(flag) {    		
    		request.setAttribute("useable", "yes");
    		request.setAttribute("chkId", id);
    		
    	}else {
    		request.setAttribute("useable", "no");
    		
    		
    	}
    	
    	forward = new ActionForward("/member/recommendCheckForm.jsp", false);
    	
    	return forward;
    	
	}

}
