package gongu.action;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import gongu.svc.GonguListService;
import vo.ActionForward;
import vo.Gongu;

public class GonguListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		// 목록을 다 가져오는 것이기때문에 파라미터 값이 필요없음
		GonguListService gonguListService = new GonguListService(); // 서비스

		ArrayList<Gongu> gonguList = gonguListService.getGonguList();
		request.setAttribute("gonguList", gonguList);//넘어가는 정보2
		

		forward = new ActionForward("/gongu/gonguList.jsp", false);// public ActionForward(String path, boolean redirect)

		return forward;
	}

}
