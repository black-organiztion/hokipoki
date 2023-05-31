package admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import action.Action;
import admin.svc.AdminClosingGonguListService;
import admin.svc.AdminOngoingGonguListService;
import admin.svc.AdminSellerListService;
import gongu.svc.GonguListService;
import vo.ActionForward;
import vo.Gongu;

public class AdminMainAction implements Action {

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

		}else {
			
			String loginId = (String)session.getAttribute("loginId");
			int loginAuthor = (int)session.getAttribute("loginAuthor");
			
			
			
			
			//4. 공통)미응답문의건수
			
			//5. 판매자)진행중인공구목록
//			if(loginAuthor>0) {
//				AdminOngoingGonguListService adminOngoingGonguListService = new AdminOngoingGonguListService(); 
//				ArrayList<Gongu> onGoingList = adminOngoingGonguListService.getOngoingList(loginId,loginAuthor);
//				
//				request.setAttribute("onGoingList", onGoingList);
//				
//			}else {
//				//1. 관리자)공구승인대기건수
//				GonguListService gonguListService = new GonguListService(); // 서비스
//				int standByCnt = gonguListService.gonguStandByCnt(loginId,loginAuthor);
//				
//				//2. 관리자)회원가입승인대기건수
//				AdminSellerListService adminSellerListService = new AdminSellerListService();
//				int sellerStandByCnt = adminSellerListService.sellerStandByCnt(loginId,loginAuthor); 
//				
//				//3. 관리자)마감임박공구
//				AdminClosingGonguListService adminClosingGonguListService = new AdminClosingGonguListService();
//				ArrayList<Gongu> closingList = adminClosingGonguListService.getClosingList();
//				
//				request.setAttribute("standByCnt", standByCnt);
//				request.setAttribute("sellerStandByCnt", sellerStandByCnt);
//				request.setAttribute("closingList",closingList);
//			}

			request.setAttribute("pagefile", "/admin/adminMain.jsp");
    		forward = new ActionForward("/admin/adminTemplate.jsp", false);
		}
		

		
		return forward;
	}

	public String getOnGoingList(String loginId, int loginAuthor) {
		String result = null;
		
		AdminOngoingGonguListService adminOngoingGonguListService = new AdminOngoingGonguListService(); 
		ArrayList<Gongu> onGoingList = adminOngoingGonguListService.getOngoingList(loginId,loginAuthor);
		ObjectMapper objectMapper = new ObjectMapper();
		
		try {
			result = objectMapper.writeValueAsString(onGoingList);
			
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public String getClosingList(String loginId, int loginAuthor) {
		String result = null;
		
		AdminClosingGonguListService adminClosingGonguListService = new AdminClosingGonguListService();
		ArrayList<Gongu> closingList = adminClosingGonguListService.getClosingList();
		ObjectMapper objectMapper = new ObjectMapper();
		
		try {
			result = objectMapper.writeValueAsString(closingList);
			
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int getStandbyCnt(String loginId, int loginAuthor) {
		int standByCnt = 0;
		
		GonguListService gonguListService = new GonguListService(); // 서비스
		standByCnt = gonguListService.gonguStandByCnt(loginId,loginAuthor);
		
		return standByCnt;
	}

	public int getSellerStandbyCnt(String loginId, int loginAuthor) {
		int sellerStandByCnt = 0;
		
		AdminSellerListService adminSellerListService = new AdminSellerListService();
		sellerStandByCnt = adminSellerListService.sellerStandByCnt(loginId,loginAuthor); 
		
		return sellerStandByCnt;
	}

}
