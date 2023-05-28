package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import member.svc.HeartingService;
import vo.ActionForward;

public class HeartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean flag = false;
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		int gongu_id = Integer.parseInt(request.getParameter("id"));		
		HeartingService heartingService = new HeartingService();
		flag = heartingService.insertHeart(member_id,gongu_id);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(flag) {
			out.println("<script>");
			out.println("alert('찜하기 완료');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('찜하기 실패');");
			out.println("</script>");			
		}
		
		
		return forward;
	}

}
