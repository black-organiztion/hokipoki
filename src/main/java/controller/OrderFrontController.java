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
import admin.action.AdminSellerJoinCheckAction;
import order.action.AdminOrderDetailViewAction;
import order.action.AdminOrderListAction;
import order.action.AllOrderListAction;
import order.action.MemberOrderListAction;
import order.action.MemberPaymentAction;
import vo.ActionForward;

/**
 * Servlet implementation class OrderFrontController
 */
@WebServlet("*.or")
public class OrderFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private void doProccess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	request.setCharacterEncoding("utf-8");
		
    	String RequestURI = request.getRequestURI(); //전체 uri 가져오기
    	String ContextPath = request.getContextPath(); //컨텍스트 패스(root 경로) 가져오기
    	String command = RequestURI.substring(ContextPath.length()); //요청받은 주소
    	
    	System.out.println(command);
    	
    	Action action = null;
    	ActionForward forward = null;
    	
    	if(command.equals("/adminOrderListAction.or")){
    		action = new AdminOrderListAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	else if(command.equals("/memberOrderListAction.or")){
    		action = new MemberOrderListAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	
    	else if(command.equals("/adminOrderDetailViewAction.or")){
    		action = new AdminOrderDetailViewAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}else if(command.equals("/memberPayment.or")){
    		action = new MemberPaymentAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}}
    	/*
    	else if(command.equals("/memberOrderDetailViewAction.or")){
    		action = new MemberOrderDetailViewAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}*/
    	else if(command.equals("/allorderlist.or")) {
    		action = new AllOrderListAction();
    		try {
    			forward = action.execute(request, response);
    		}catch(Exception e) {
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
		doProccess(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProccess(request,response);
	}

}
