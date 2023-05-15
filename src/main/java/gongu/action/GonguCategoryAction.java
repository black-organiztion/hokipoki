package gongu.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import gongu.svc.CategoryListService;
import vo.ActionForward;
import vo.Gongu;

public class GonguCategoryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String category = request.getParameter("category");
		System.out.println("카테고리:"+category);
		ArrayList<Gongu> categoryList = new ArrayList<>();
		CategoryListService categoryListService = new CategoryListService();
		categoryList = categoryListService.categoryList(category);
		
		request.setAttribute("categoryList", categoryList);
		
		forward=new ActionForward("./index.jsp", false);
	
		request.setAttribute("pagefile", "/gongu/gonguCategoryList.jsp");
		
		return forward;
	}

}
