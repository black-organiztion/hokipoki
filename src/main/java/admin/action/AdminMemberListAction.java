package admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import admin.svc.AdminMemberListService;
import vo.ActionForward;
import vo.Member;

public class AdminMemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		//파라미터처리
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		int loginAuthor = (int)session.getAttribute("loginAuthor");
		
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
			//모든회원이므로 파라미터 X
			//서비스 생성
			AdminMemberListService adminMemberListService = new AdminMemberListService();
			
			ArrayList<Member> memberList = adminMemberListService.getMemberList();
			
			if(memberList.size() > 0) {
				request.setAttribute("memberList", memberList);
				request.setAttribute("pagefile", "/admin/adminMemberConfig.jsp");
				forward = new ActionForward("/admin/adminTemplate.jsp",false);
				
			}else {
				//로그인 이동
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('회원목록조회에 실패했습니다. 다시 시도해주세요.');");
				out.print("history.back();");
				out.print("</script>");
			}
			
			
		}
		
		return forward;
	}

}
