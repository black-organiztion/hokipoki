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
import vo.PageInfo;

public class AllOrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
			
			ArrayList<MemberOrderGongu> allOrderList = null;
		
			HttpSession session = request.getSession();
			
			int page=1;
			int limit = 5;
			int limitPage=5;
			
			if(request.getParameter("page")!=null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			
			
			String id = (String)session.getAttribute("member_id");	
			MyInfoService myInfoService = new MyInfoService();
			Member member  = myInfoService.showMyInfo(id);	
			AllOrderListService allOrderListService = new AllOrderListService();
			allOrderList = allOrderListService.allOrderList(id);
			int listCount=allOrderListService.getListCount(id);
			
			
			//총 리스트 수를 받아옴
			int maxPage = (int)((double)listCount/limit+0.95);
			int startPage = ((int)((double)page/limitPage+0.9)-1)*limitPage+1;
			int endPage = startPage + limitPage-1;
			if(endPage>maxPage) endPage=maxPage;	
			
			PageInfo pageInfo = new PageInfo();
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);
			
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("allList", allOrderList);
			request.setAttribute("member", member);
			request.setAttribute("pagefile", "/member/memberRecentOrder.jsp");
			request.setAttribute("infofile", "allorder");
			forward = new ActionForward("./index.jsp", false);
	
			return forward;
	}

}
