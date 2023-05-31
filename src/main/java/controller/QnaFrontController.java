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
import admin.action.AdminMainAction;
import member.action.QnaFormAction;
import qna.action.MemberQnaListAction;
import qna.action.MemberQuestionAction;
import qna.action.QnaDetailViewAction;
import vo.ActionForward;

/**
 * Servlet implementation class QnaFrontController
 */
@WebServlet("*.qu")
public class QnaFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaFrontController() {
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
    	
    	if(command.equals("/qnaListAction.qu")) {
    		action = new MemberQnaListAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	else if(command.equals("/questionForm.qu")){
    		request.setAttribute("pagefile", "/member/memberQuestionForm.jsp");
			forward = new ActionForward("./index.jsp", false);
    	}
    	else if(command.equals("/memberQuestionAction.qu")) {
    		action = new MemberQuestionAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	else if(command.equals("/qnaDetailViewAntion.qu")) {
    		action = new QnaDetailViewAction();
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
