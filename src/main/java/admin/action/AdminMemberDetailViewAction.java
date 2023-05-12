package admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import delivery.svc.DeliveryGetService;
import member.svc.MyInfoService;
import vo.ActionForward;
import vo.Delivery;
import vo.Member;

public class AdminMemberDetailViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		//파라미터처리
		String loginId = (String)session.getAttribute("loginId");
		int loginAuthor = (int)session.getAttribute("loginAuthor");
		String member_id = request.getParameter("member_id");
		
		//세션 로그인&권한체크
		if(loginId == null || loginId.equals("") || loginAuthor != 0) {
			//로그인 이동
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('권한이 없습니다. 다시 로그인해주세요');");
			out.print("location.href='adminLogin.ad';");
			out.print("</script>");
			
		}else {
			//기능1. 회원정보가져오기
			MyInfoService myInfoService = new MyInfoService();
			Member member  = myInfoService.showMyInfo(member_id);	

			//기능2. 회원구매정보가져오기
			
			//기능3. 회원구매금액총합 계산
			
			//기능4. 회원배송지가져오기
			DeliveryGetService deliveryGetService = new DeliveryGetService();
			//ArrayList<Delivery>deliveryList = deliveryGetService.getDeliveryList(member_id);
			
			
			
		}
		

		return forward;
	}

}
