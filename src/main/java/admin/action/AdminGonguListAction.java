package admin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import action.Action;
import vo.ActionForward;
import vo.Gongu;
import gongu.svc.*;

public class AdminGonguListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		// 목록을 다 가져오는 것이기때문에 파라미터 값이 필요없음
		GonguListService gonguListService = new GonguListService(); // 서비스

		ArrayList<Gongu> gonguList = gonguListService.getGonguList();
		request.setAttribute("gonguList", gonguList);//넘어가는 정보2
		//System.out.println(gonguList);
		request.setAttribute("pagefile", "/admin/adminGonguConfig.jsp");
		forward = new ActionForward("/admin/adminTemplate.jsp", false);// public ActionForward(String path, boolean redirect)
		
		return forward;
	}

}
