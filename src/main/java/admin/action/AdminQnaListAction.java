package admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import qna.action.AdminQnaListService;
import qna.svc.QnaDetailViewService;
import vo.ActionForward;
import vo.PageInfo;
import vo.Qna;

public class AdminQnaListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		//파라미터처리
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
			String[] filterArr = request.getParameterValues("gongu_status");
			String sOption = request.getParameter("search_option");
			String sKeyword = request.getParameter("search_keyword");
			
			AdminQnaListService adminQnaListService = new AdminQnaListService();
			//리스트
			ArrayList<Qna> qnaList = null;
			//필터
			ArrayList<String> filterList = new ArrayList<>();
			
			//1. 페이지계산
			
			//페이징
			int page = 1;
			int limit = 10;
			int limitPage = 10;
			int listCount = 0;
			
			//필터링체크
			if(filterArr != null) {//최초 페이지 로딩시 null값 넘어옴
				for(String filter:filterArr) {
					filterList.add(filter);
					if(filter.equals("all")) {
						break;
					}
				}
			}else {
				filterList.add("all");
			}
			
			//페이지체크:요청페이지 없으면 page는 1
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}

	
			//검색체크 및 검색값 없음 -> 파라미터 null 
			if((sOption==null || sOption.equals("")) && (sKeyword == null || sKeyword.equals(""))) {
				sOption = null;
				sKeyword = null;
			}
			
			listCount = adminQnaListService.getListCount(loginId,loginAuthor,sOption,sKeyword,filterList);
			
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
			
			//미응답건수(필터,검색에 영향X)
			int noAnswerCnt = adminQnaListService.getNoAnswerCnt(loginId,loginAuthor);
			
			if(listCount>=0) {
				qnaList = adminQnaListService.getQnaList(page,limit,loginId,loginAuthor,sOption,sKeyword,filterList);
				
				request.setAttribute("pageInfo", pageInfo);
				request.setAttribute("sOption", sOption);
				request.setAttribute("sKeyword", sKeyword);
				request.setAttribute("filterList", filterList);
				request.setAttribute("noAnswerCnt", noAnswerCnt);
				request.setAttribute("qnaList", qnaList);//넘어가는 정보2
				request.setAttribute("pagefile", "/admin/adminQnaConfig.jsp");
				forward = new ActionForward("/admin/adminTemplate.jsp",false);
				
			}else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('문의목록조회에 실패했습니다. 다시 시도해주세요');");
				out.print("history.back();");
				out.print("</script>");
			}

		}
		
		return forward;
	}

}
