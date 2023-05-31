package order.action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import order.svc.OrderDetailViewService;
import order.svc.OrderListService;
import vo.ActionForward;

public class AdminOrderDetailViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();

		if(session.getAttribute("loginId")==null || session.getAttribute("loginId").equals("") || 
				session.getAttribute("loginAuthor") == null || (int)session.getAttribute("loginAuthor") > 1) {
			//로그인 이동
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('권한이 없습니다. 다시 로그인해주세요');");
			out.print("location.href='adminLogin.ad';");
			out.print("</script>");

		}else { //접근권한 있음
			
			String loginId = (String)session.getAttribute("loginId");
			int loginAuthor = (int)session.getAttribute("loginAuthor");
			int order_id = Integer.parseInt(request.getParameter("order_id"));
			
			//서비스
			OrderDetailViewService orderDetailViewService = new OrderDetailViewService();
			
			//주문정보 가져오기			
			Map<String,Object> order = orderDetailViewService.getOrderDetail(loginId,loginAuthor,order_id);
			
			if(order.size()>0) {//주문상세불러오기 성공
				
				request.setAttribute("order", order);
				request.setAttribute("pagefile", "/admin/orderDetailView.jsp");
				forward = new ActionForward("/admin/adminTemplate.jsp",false);
				
			}
			
		}
		
		return forward;
	}

}
