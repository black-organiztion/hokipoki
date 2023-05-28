package member.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import member.svc.HeartListService;
import vo.ActionForward;
import vo.Gongu;

public class HeartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			ActionForward forward =null;
			ArrayList<Gongu> heartList  = null; 
			HttpSession session = request.getSession();
			String member_id = (String)session.getAttribute("member_id");
			
			HeartListService heartListService = new HeartListService();
			
			heartList = heartListService.getList(member_id);
			if(heartList != null) {
				request.setAttribute("heartList", heartList);
			}
			
			request.setAttribute("pagefile", "/member/memberheartList.jsp");
			forward = new ActionForward("/index.jsp", false);
			
			
			return forward;
	}

}
