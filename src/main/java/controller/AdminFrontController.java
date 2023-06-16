package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import action.Action;
import admin.action.*;
import gongu.action.AdminGonguDeleteAction;
import gongu.action.MemberGonguListAction;
import qna.action.AdminQnaDetailViewAction;
/*import admin.action.adminLoginAction;
import admin.action.adminSellerListAction;*/
import vo.ActionForward;

/**
 * Servlet implementation class HokipokiFrontController
 */
@WebServlet("*.ad")
public class AdminFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		
    	String RequestURI = request.getRequestURI(); //전체 uri 가져오기
    	String ContextPath = request.getContextPath(); //컨텍스트 패스(root 경로) 가져오기
    	String command = RequestURI.substring(ContextPath.length()); //요청받은 주소
    	
    	System.out.println(command);
    	
    	//5.Action, ActionForwrad 담을 변수 선언;
    	Action action = null;
    	ActionForward forward = null;
    	
    	if(command.equals("/adminLogin.ad")) {
    
    		forward = new ActionForward("./admin/adminLogin.jsp", false);
    	}
    	else if(command.equals("/adminJoin.ad")){
    		forward = new ActionForward("./admin/adminJoinForm.jsp", false);
    	}
    	else if(command.equals("/adminLogout.ad")){
    		request.getSession().invalidate();
    		forward = new ActionForward("/adminLogin.ad", false);
    	}
    	else if(command.equals("/adminMain.ad")){
    		action = new AdminMainAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
    	}
    	else if(command.equals("/adminMainAction.ad")){
    		HttpSession session = request.getSession();
    		String id = (String)session.getAttribute("loginId");
    		int author = (int)session.getAttribute("loginAuthor");
    		
    		System.out.println(id);
    		 System.out.println(author);
    		
			if(request.getParameter("loginId") == null || request.getParameter("loginId").equals("")) {
				//로그인 이동
    			response.setContentType("text/html;charset=utf-8");
    			PrintWriter out = response.getWriter();
    			out.print("<script>");
    			out.print("alert('권한이 없습니다. 다시 로그인해주세요');");
    			out.print("location.href='adminLogin.ad';");
    			out.print("</script>");
				
			}else {
    				String loginId = request.getParameter("loginId");
            		int loginAuthor = Integer.parseInt(request.getParameter("loginAuthor"));
            		JSONObject responseData = new JSONObject();
            		
            		if(loginAuthor > 0) {//판매자라면
            			String onGoingList = new AdminMainAction().getOnGoingList(loginId,loginAuthor);
            			int noAnswerCnt = new AdminMainAction().getNoAnswerCnt(loginId,loginAuthor);
            			responseData.put("onGoingList", onGoingList);
            			responseData.put("noAnswerCnt", noAnswerCnt);
            			
            		}else {//관리자라면
            			String closingList = new AdminMainAction().getClosingList(loginId,loginAuthor);
            			int standByCnt = new AdminMainAction().getStandbyCnt(loginId,loginAuthor);
            			int sellerStandByCnt = new AdminMainAction().getSellerStandbyCnt(loginId,loginAuthor);
            			int noAnswerCnt = new AdminMainAction().getNoAnswerCnt(loginId,loginAuthor);
            			
            			responseData.put("closingList", closingList);
            			responseData.put("standByCnt", standByCnt);
            			responseData.put("sellerStandByCnt", sellerStandByCnt);
            			responseData.put("noAnswerCnt", noAnswerCnt);
            		}
            					
              	  response.setContentType("application/json");
              	  response.setCharacterEncoding("UTF-8");
              	  response.getWriter().write(responseData.toString());
        			
			}
    	}
    	else if(command.equals("/adminStandby.ad")){
    		forward = new ActionForward("./admin/adminStandby.jsp", false);
    	}
    	else if(command.equals("/adminJoinAction.ad")){
    		action = new AdminJoinAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	else if(command.equals("/adminLoginAction.ad")){
    		action = new AdminLoginAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	else if(command.equals("/adminSellerIdCheck.ad")){
    		String id = request.getParameter("seller_id");
    		String result = new AdminSellerIdCheckAction().checkId(id);
    		System.out.println("컨트롤러 result : "+ result);
    		response.setContentType("text/plain;charset=UTF-8");
            response.getWriter().write(result);
    		
    	}
    	else if(command.equals("/adminSellerListAction.ad")){
    		action = new AdminSellerListAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
 
    	else if(command.equals("/adminSellerJoinCheck.ad")){
    		action = new AdminSellerJoinCheckAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	else if(command.equals("/adminGonguListAction.ad")){
    		action = new AdminGonguListAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	else if(command.equals("/adminGonguDetailViewAction.ad")){
    		action = new AdminGonguDetailViewAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	else if(command.equals("/adminGonguSetStatus.ad")){
    		action = new AdminGonguSetStatusAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	else if(command.equals("/adminGonguStartAction.ad")){
    		action = new AdminGonguStartAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	else if(command.equals("/adminGonguCloseAction.ad")){
    		action = new AdminGonguCloseAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	else if(command.equals("/adminMemberListAction.ad")){
    		action = new AdminMemberListAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	else if(command.equals("/adminMemberDetailView.ad")){
    		action = new AdminMemberDetailViewAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	else if(command.equals("/adminMyPage.ad")){
    		action = new AdminMyPageAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	else if(command.equals("/adminSellerIdentify.ad")){
    		String id = request.getParameter("seller_id");
    		String pw = request.getParameter("check_pw");
    		String result = new AdminSellerIdCheckAction().checkPass(id,pw);
    		System.out.println("컨트롤러 result : "+ result);
    		response.setContentType("text/plain;charset=UTF-8");
            response.getWriter().write(result);
    		
    	}
    	else if(command.equals("/adminSellerUpdate.ad")){
    		action = new AdminSellerUpdateAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
    	}
    	else if(command.equals("/adminGonguDeleteAction.ad")){
    		action = new AdminGonguDeleteAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
    	}
    	else if(command.equals("/adminQnaListAction.ad")){
    		action = new AdminQnaListAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
    	}
    	else if(command.equals("/adminQnaDetailViewAction.ad")){
    		action = new AdminQnaDetailViewAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
    	}
    	
    	
    	

    	//포워딩
    	if(forward != null) {
    		if(forward.isRedirect()) {
    			response.sendRedirect(forward.getPath());
	    	}else {
	    		RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath()); 				
				dispatcher.forward(request, response);
	    	}
    	}

		
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request,response);
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request,response);
	}

}
