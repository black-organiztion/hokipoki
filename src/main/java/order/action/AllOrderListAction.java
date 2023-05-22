package order.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import member.svc.MyInfoService;
import order.svc.AllOrderListService;
import vo.ActionForward;
import vo.Member;
import vo.MemberOrderGongu;

public class AllOrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
			
			ArrayList<MemberOrderGongu> allOrderList = null;
		
			HttpSession session = request.getSession();
			
			String id = (String)session.getAttribute("member_id");	
			MyInfoService myInfoService = new MyInfoService();
			Member member  = myInfoService.showMyInfo(id);	
			AllOrderListService allOrderListService = new AllOrderListService();
			allOrderList = allOrderListService.allOrderList(id);
			request.setAttribute("allList", allOrderList);
			request.setAttribute("member", member);
			request.setAttribute("pagefile", "/member/memberAllOrderCheckForm.jsp");
			request.setAttribute("infofile", "/member/memberRecentOrder.jsp");
			forward = new ActionForward("./index.jsp", false);
	
			return forward;
	}

}
