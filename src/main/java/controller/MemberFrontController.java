package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import member.action.MemberJoinAction;
import member.action.MemberLoginAction;
import vo.ActionForward;

/**
 * Servlet implementation class MemberFrontController
 */
@WebServlet("*.me")
public class MemberFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String RequestURI = request.getRequestURI();
		String ContextPath = request.getContextPath();
		String command = RequestURI.substring(ContextPath.length());
		
		System.out.println("command:"+command);
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/memberJoinAction.me")) {
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}			
		}else if(command.contains("/memberJoin.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/memberjoinForm.jsp");	
		}
	else if(command.equals("/memberLogin.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/memberloginForm.jsp");
			
		}else if(command.equals("/memberLoginAction.me")) {
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward!=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}			
		}
		
		
	}

}
