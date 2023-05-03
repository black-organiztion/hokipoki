package order.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import order.svc.OrderListService;
import vo.ActionForward;

public class MemberOrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		
		//id 파라미터 받아서 세션에 저장
		String member_id = request.getParameter("member_id");
		
		 
		session.setAttribute("loginId", member_id);
		
		String loginId = (String)session.getAttribute("loginId");
		int loginAuthor = 10; //일반회원은 무조건 10
		
		if(loginId == null || loginId.equals("")) {//로그인 세션 체크
			//로그인 이동
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인 후 이용해주세요');");
			out.print("location.href='memberLogin.me';");
			out.print("</script>");
			
		}else{

			//서비스
			OrderListService orderListService = new OrderListService();
			
			//주문리스트 가져오기			
			//ArrayList<MemberOrder> orderList =
			List<Object> orderList = orderListService.getOrderList(loginId,loginAuthor);
			
			if(orderList.size() > 0) {
				
				request.setAttribute("orderList", orderList);
				request.setAttribute("pagefile", "/order/orderList.jsp");
				forward = new ActionForward("/index.jsp",false);
				
			}

		}
			
			
		return forward;
	}

}
