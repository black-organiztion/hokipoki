package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import member.action.memberQnAFormAction;
import qna.action.MemberQnAListAction;
import qna.action.memberQuestionEnroll;
import vo.ActionForward;

/**
 * Servlet implementation class QuestionController
 */
@WebServlet("*.qu")
public class QuestionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
    	String RequestURI = request.getRequestURI(); //전체 uri 가져오기
    	String ContextPath = request.getContextPath(); //컨텍스트 패스(root 경로) 가져오기
    	String command = RequestURI.substring(ContextPath.length()); //요청받은 주소
        
        ActionForward forward = null;
        Action action = null;
        
        System.out.println(command);
        
     if(command.equals("/memberQuestionAction.qu")) {
    	action = new memberQuestionEnroll();
    	try {
    		forward = action.execute(request, response);
    	}catch(Exception e){
    		e.printStackTrace();
    	}
     }else if(command.equals("/memberQnAList.qu")) {
    	 action = new MemberQnAListAction();
    	 try {
    		 forward = action.execute(request, response);
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
     }else if(command.equals("/memberQnAForm.qu")) {
    	action = new memberQnAFormAction();
    	try {
    		forward = action.execute(request, response);
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
     }
        
 	if (forward != null) {
		if (forward.isRedirect()) {
			response.sendRedirect(forward.getPath());
		} else {
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
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
