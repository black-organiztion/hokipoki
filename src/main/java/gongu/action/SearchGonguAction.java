package gongu.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import gongu.svc.GonguSearchService;
import vo.ActionForward;
import vo.Gongu;

public class SearchGonguAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String search = request.getParameter("search");
		ArrayList<Gongu> searchList = new ArrayList<>();
		GonguSearchService gonguSearchService = new GonguSearchService();
		searchList = gonguSearchService.getSearchList(search);
		
		
		forward = new ActionForward("/index.jsp", false);
		
		request.setAttribute("searchList", searchList);
		request.setAttribute("pagefile", "/gongu/gonguSearchList.jsp");
		
		return forward;
	}

}
