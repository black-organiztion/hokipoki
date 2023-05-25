package qna.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import qna.svc.QnaDetailViewService;
import vo.ActionForward;
import vo.Qna;

public class QnaDetailViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		
		//로그인체크
		if(session.getAttribute("member_id") == null || session.getAttribute("member_id").equals("")) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='memberLogin.me';");
			out.println("</script>");
			
		}else {
			//파라미터 체크
			int qna_id = Integer.parseInt(request.getParameter("qna_id"));
			
			QnaDetailViewService qnaDetailViewService = new QnaDetailViewService();
			
			Qna qna = qnaDetailViewService.getQna(qna_id);
			
			if(qna != null) {

				request.setAttribute("qna", qna);
				request.setAttribute("pagefile", "/member/qnaDetailView.jsp");
				forward = new ActionForward("./index.jsp", false);
				
			}else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('문의상세보기 오류가 발생했습니다. 다시 시도해주세요.');");
				out.println("history.back();");
				out.println("</script>");
			}
		}
		
		return forward;
	}

}
