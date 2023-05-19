package gongu.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import gongu.svc.MenuListService;
import vo.ActionForward;
import vo.Gongu;

public class MenuListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		MenuListService menuListService = new MenuListService();
		String menu = request.getParameter("menu");
		if(menu.equals("popular")) {
			menu="gongu_reserve";
		}else if(menu.equals("new")) {
			menu="gongu_startdate";
		}else if(menu.equals("end")) {
			menu="gongu_findate";			
		}
		ArrayList <Gongu> menuList = new ArrayList<Gongu>();
		menuList = menuListService.getMenuList(menu);		
		
		request.setAttribute("menuList", menuList);		
		request.setAttribute("pagefile","/gongu/gonguMenuList.jsp");
		
		forward=new ActionForward("./index.jsp", false);
		return forward;
	}

}
