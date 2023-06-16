package gongu.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import gongu.svc.GonguSearchService;
import vo.ActionForward;
import vo.Gongu;

public class qnaGonguListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String search = request.getParameter("search");
		System.out.println("키워드파라미터"+search);
		ArrayList<Gongu> searchList = new ArrayList<>();
		GonguSearchService gonguSearchService = new GonguSearchService();
		searchList = gonguSearchService.getSearchList(search);
		
		//System.out.println(searchList);
		
		request.setAttribute("searched", search);
		request.setAttribute("searchList", searchList);
		forward = new ActionForward("/member/qnaGonguList.jsp",false);
		
		return forward;
	}

}
