package gongu.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import gongu.svc.HomeGonguListService;
import vo.ActionForward;
import vo.Gongu;

public class GonguHomeListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			ActionForward forward = null;
			
			HomeGonguListService popularListService = new HomeGonguListService();
			
			ArrayList <Gongu> popularList = new ArrayList<Gongu>();
			popularList = popularListService.getPopularList();
			
			ArrayList <Gongu> newList = new ArrayList<Gongu>();
			newList = popularListService.getNewList();		
			
			
			
			ArrayList <Gongu> oldList = new ArrayList<Gongu>();
			oldList = popularListService.getOldList();
			
			
			request.setAttribute("popularList", popularList);
			request.setAttribute("newList", newList);
			request.setAttribute("oldList", oldList);
			request.setAttribute("pagefile","/gonguHomeList.go");
			forward=new ActionForward("/home.jsp", false);
			return forward;
	}

}
