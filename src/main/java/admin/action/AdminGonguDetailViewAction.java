package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import gongu.svc.GonguViewService;
import vo.ActionForward;
import vo.Gongu;

public class AdminGonguDetailViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;

		int gongu_id = Integer.parseInt(request.getParameter("gongu_id"));
		Gongu gongu = GonguViewService.getGonguView(gongu_id);
		request.setAttribute("gongu", gongu);
		
		request.setAttribute("pagefile", "/admin/adminGonguDetailView.jsp");
		forward = new ActionForward("/admin/adminTemplate.jsp", false);

		return forward;
	}

}
