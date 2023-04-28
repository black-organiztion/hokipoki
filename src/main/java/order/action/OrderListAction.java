package order.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import order.svc.OrderListService;
import vo.ActionForward;
import vo.MemberOrder;

public class OrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		int loginAuthor = (int)session.getAttribute("loginAuthor");
		
		if(loginId == null || (loginAuthor!=0 && loginAuthor!=1)) {//접근권한이 없음(관리자거나 판매자가 아니면 권한없음)
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
			ArrayList<MemberOrder> orderList = orderListService.getOrderList(loginId,loginAuthor);
			
			if(orderList.size()>0) {
				request.setAttribute("orderList", orderList);
				request.setAttribute("pagefile", "/admin/orderConfig.jsp");
				forward = new ActionForward("/admin/adminTemplate.jsp",false);
				
			}
			
		}
		
		return forward;
	}

}
