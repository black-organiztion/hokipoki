package admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import vo.ActionForward;
import vo.Gongu;
import gongu.svc.*;

public class AdminGonguListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		int loginAuthor = (int)session.getAttribute("loginAuthor");
		
		//세션 로그인&권한체크
		if(loginId == null || loginId.equals("") || loginAuthor > 1) {
			//로그인 이동
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('권한이 없습니다. 다시 로그인해주세요');");
			out.print("location.href='adminLogin.ad';");
			out.print("</script>");
			
		}else {//권한이 있다면
			
			GonguListService gonguListService = new GonguListService(); // 서비스
			
			ArrayList<Gongu> gonguList = null;
			
			switch(loginAuthor) {
			//관리자 권한이라면 모두 가져오기
			case 0: gonguList = gonguListService.getGonguList(); break;
					
			//판매자권한이라면 아이디와 일치하는 목록만 가져오기
			case 1: gonguList = gonguListService.getGonguList(loginId); break;
			
			}
			
			if(gonguList.size()>=0) {
				request.setAttribute("gonguList", gonguList);//넘어가는 정보2
				//System.out.println(gonguList);
				request.setAttribute("pagefile", "/admin/adminGonguConfig.jsp");
				forward = new ActionForward("/admin/adminTemplate.jsp", false);// public ActionForward(String path, boolean redirect)
				
			}else{
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('공구목록조회에 실패했습니다. 다시 시도해주세요');");
				out.print("history.back();");
				out.print("</script>");
			}
		
		}
		return forward;

	}

}
