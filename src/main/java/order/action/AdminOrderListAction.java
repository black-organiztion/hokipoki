package order.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import order.svc.OrderListService;
import vo.ActionForward;

public class AdminOrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		int loginAuthor = (int)session.getAttribute("loginAuthor");
		String[] filterArr = request.getParameterValues("order_status");
		System.out.println(filterArr);
		
		ArrayList<String> filterList = new ArrayList<>();
		
		//필터링체크
		if(filterArr != null) {//최초 페이지 로딩시 null값 넘어옴
			for(String filter:filterArr) {
				filterList.add(filter);
				if(filter.equals("all")) {
					break;
				}
			}
		}else {
			filterList.add("all");
		}
		
		if(loginId == null || loginId.equals("") || (loginAuthor!=0 && loginAuthor!=1) ) {//접근권한이 없음(관리자거나 판매자가 아니면 권한없음)
			//로그인 이동
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('권한이 없습니다. 다시 로그인해주세요');");
			out.print("location.href='adminLogin.ad';");
			out.print("</script>");
			
		}else { //접근권한 있음
			
			//서비스
			OrderListService orderListService = new OrderListService();
			
			//주문리스트 가져오기			
			//ArrayList<MemberOrder> orderList =
			List<Object> orderList = orderListService.getOrderList(loginId,loginAuthor,filterList);
			
			if(orderList.size() >= 0) {
				request.setAttribute("filterList", filterList);
				request.setAttribute("orderList", orderList);
				request.setAttribute("pagefile", "/admin/orderConfig.jsp");
				forward = new ActionForward("/admin/adminTemplate.jsp",false);
				
			}else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('주문목록조회 오류가 발생했습니다. 다시 시도해주세요');");
				out.print("history.back();");
				out.print("</script>");
			}
			
		}
		
		return forward;
	}

}
