package gongu.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import gongu.svc.GonguViewService;
import vo.ActionForward;
import vo.Gongu;

public class GonguViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;

		int id = Integer.parseInt(request.getParameter("id"));
		Gongu gongu = GonguViewService.getGonguView(id);
		request.setAttribute("Gongu", gongu);


		forward = new ActionForward("dogView.jsp", false);

		return forward;
	}

}
