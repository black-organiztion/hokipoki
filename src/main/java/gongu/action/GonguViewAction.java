package gongu.action;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import gongu.svc.GonguViewService;
import vo.ActionForward;
import vo.Gongu;

public class GonguViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;

		int id = Integer.parseInt(request.getParameter("id"));
		Gongu gongu = GonguViewService.getGonguView(id);
		request.setAttribute("gongu", gongu);
		// 현재 날짜 가져오기
		LocalDate currentDate = LocalDate.now();
		
		// 주어진 문자열을 LocalDate로 변환
		LocalDate targetDate = LocalDate.parse(gongu.gongu_findate, DateTimeFormatter.ISO_LOCAL_DATE);
		
		
		long daysDifference = ChronoUnit.DAYS.between(currentDate, targetDate);
		
		request.setAttribute("subday", daysDifference);
	 	 

	    
	 	
	 	

	

		forward = new ActionForward("gongu/gonguView.jsp", false);

		return forward;
	}

}
