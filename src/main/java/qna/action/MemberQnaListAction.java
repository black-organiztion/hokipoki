package qna.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import qna.svc.MemberQnaListService;
import vo.ActionForward;
import vo.PageInfo;
import vo.Qna;

public class MemberQnaListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		//파라미터체크
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("member_id");
		int loginAuthor = 10; //일반회원은 loginAuthor 10으로 고정
		
		//세션 로그인&권한체크
		if(loginId == null || loginId.equals("")) {
			//로그인 이동
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인이 필요합니다.');");
			out.print("location.href='memberLogin.me';");
			out.print("</script>");
			
		}else {
			//서비스생성
			MemberQnaListService memberQnaListService = new MemberQnaListService();
			
			ArrayList<Qna> qnaList = null;
			
			
			//1.페이지계산
			//페이징
			int page = 1;
			int limit = 10;
			int limitPage = 10;
			int listCount = 0;
			
			//페이지체크:요청페이지 없으면 page는 1
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
				//System.out.println("파라미터"+page);
			}
			//System.out.println("기본값"+page);
			
			listCount = memberQnaListService.getListCount(loginId,loginAuthor);
			
			//페이지 계산
			int maxPage = (int)((double)listCount/limit+0.95);
			int startPage = ((int)((double)page/limitPage+0.9)-1) * limitPage + 1;
			int endPage = startPage + limitPage -1;
			if(endPage>maxPage) endPage = maxPage;

			PageInfo pageInfo = new PageInfo();
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);
			
			if(listCount >= 0) {
				qnaList = memberQnaListService.getQnaList(page,limit,loginId,loginAuthor);
				
				request.setAttribute("pageInfo", pageInfo);
				request.setAttribute("qnaList", qnaList);
				request.setAttribute("pagefile", "/member/memberQnaList.jsp");
				forward = new ActionForward("./index.jsp", false);
			}
			
			
					
		}
		
		return forward;
	}

}
