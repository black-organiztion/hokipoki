package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import admin.action.*;
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
    		request.setAttribute("pagefile", "/admin/adminMain.jsp");
    		forward = new ActionForward("/admin/adminTemplate.jsp", false);
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
    	else if(command.equals("/adminSellerListAction.ad")){
    		action = new AdminSellerListAction();
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
				//데이터 넘겨줄것이 없는데 redirect아니고 dispatcher 쓴 이유? 경로때문에, 서블릿은 루트에서 실행시켜야함 //루트에서 안하면? 경로가 꼬일 수 있다 //화면과 페이지 이름을 매칭하기 위해(디스팻쳑로 보내면 url이 안바뀐다)
				
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
