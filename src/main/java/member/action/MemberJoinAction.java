package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import delivery.svc.DeliveryInsertService;
import member.svc.MemberJoinService;
import vo.ActionForward;
import vo.Delivery;
import vo.Member;

public class MemberJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		Member member = new Member();
		Delivery delivery = new Delivery();
		boolean joinResult=false;	
		boolean deliveryResult=false;	
		
		member.setMember_id(request.getParameter("id"));
		member.setMember_pw(request.getParameter("pw"));
		member.setMember_name(request.getParameter("name"));
		member.setMember_tel(request.getParameter("tel"));
		member.setMember_email(request.getParameter("email"));
		member.setRecommend_id(request.getParameter("recommend_id"));
		member.setMembership_id(request.getParameter("membership_id"));	
		
		delivery.setAddr1(request.getParameter("addr1"));
		delivery.setAddr2(request.getParameter("addr2"));
		delivery.setMember_id(request.getParameter("id"));
		delivery.setDelivery_name(request.getParameter("deliveryname"));
		delivery.setIsdefault("1");
		delivery.setReceiver_name(request.getParameter("receivername"));
		delivery.setReceiver_tel(request.getParameter("tel1.1")+request.getParameter("tel1.2")+request.getParameter("tel1.3"));
		delivery.setReceiver_tel2(request.getParameter("tel2.1")+request.getParameter("tel2.2")+request.getParameter("tel2.3"));
		delivery.setZip_code(request.getParameter("zipcode"));
		
		
		MemberJoinService memberJoinService = new MemberJoinService();
		joinResult=memberJoinService.joinMember(member);
		DeliveryInsertService deliveryInsertService = new DeliveryInsertService();
		
		deliveryResult = deliveryInsertService.insertDelivery(delivery);
		
		if(!joinResult) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('회원등록 실패')");
			out.print("history.back()");
			out.print("</script>");
			
		}else {
			
			forward =new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./member/memberloginForm.jsp");			
		}		
		
		return forward;
	}

}
