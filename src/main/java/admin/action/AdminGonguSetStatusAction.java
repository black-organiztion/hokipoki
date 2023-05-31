package admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import admin.svc.AdminGonguSetStatusService;
import vo.ActionForward;

public class AdminGonguSetStatusAction implements Action {

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

		}else{//권한이 있다면
			String loginId = (String)session.getAttribute("loginId");
			int loginAuthor = (int)session.getAttribute("loginAuthor");
			int gongu_id = Integer.parseInt(request.getParameter("gongu_id"));
			String gongu_status = request.getParameter("gongu_status");
			String nextStatus = request.getParameter("setStatus");
			String msg = "";
			String d_date = "";
			String d_text = "";
			
			
			AdminGonguSetStatusService adminGonguSetStatusService = new AdminGonguSetStatusService();
			
			boolean isNextSuccess = false;
			
			boolean nowStatusChk = true; //현재공구상태 체크
			
			

			switch(nextStatus) {
			//승인대기 -> 심사중(심사시작)
			case "1" : 
				if(!gongu_status.equals("0")) { //현재공구상태가 승인대기(0)가 아니라면 종료
					msg = "공구상태를 확인해주세요. 심사시작은 승인대기중인 공구만 진행할 수 있습니다.";
					nowStatusChk = false;
				}
				break;
			
			//심사중 -> 승인
			case "2" : 
				if(!gongu_status.equals("1")) { //현재공구상태가 심사중(1)이 아니라면 종료
					msg = "공구상태를 확인해주세요. 공구승인은 심사중인 공구만 진행할 수 있습니다.";
					nowStatusChk = false;
				}
				break;
			
			//심사중 -> 반려
			case "3" : 
				if(!gongu_status.equals("1")) { //현재공구상태가 심사중(1)이 아니라면 종료
					msg = "공구상태를 확인해주세요. 공구반려는 심사중인 공구만 진행할 수 있습니다.";
					nowStatusChk = false;
				}
				break;
			
			//진행중 -> 비활성화
			case "5" : 
				d_date = request.getParameter("gongu_disabled_date");
				d_text = request.getParameter("gongu_disabled_text");
				
				System.out.println(d_date+","+d_text);
				
				if(!gongu_status.equals("4")) { //현재공구상태가 진행중(4)이 아니라면 종료
					msg = "공구상태를 확인해주세요. 공구 비활성화는 진행중인 공구만 진행할 수 있습니다.";
					nowStatusChk = false;
				}
				break;
			
			//진행중 -> 종료(목표달성)
			//case "7" : break;
			
			//진행중 -> 종료(목표미달성)
			//case "8" : break;
			
			}
			
			
			if(!nowStatusChk) {//현재공구상태가 조건에 맞지 않을때 alert표시 및 페이지 이동
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('"+msg+"');");
				out.print("history.back();");
				out.print("</script>");
				
			}else { //조건에 맞다면 서비스에서 메서드호출
				if(nextStatus.equals("5")) {
					isNextSuccess = adminGonguSetStatusService.setNextStatus(gongu_id, nextStatus, d_date, d_text);
				}else {
					isNextSuccess = adminGonguSetStatusService.setNextStatus(gongu_id, nextStatus);
				}
				
			}
			

			if(isNextSuccess) {	
				forward = new ActionForward("adminGonguDetailViewAction.ad?gongu_id"+gongu_id, false);
				System.out.println("공구상태변경("+nextStatus+")");
				
			}else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('공구상태 변경에 실패했습니다. 다시 시도해주세요');");
				out.print("history.back();");
				out.print("</script>");
			}

		}

		return forward;
	}

}
