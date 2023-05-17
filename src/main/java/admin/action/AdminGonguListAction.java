package admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import vo.ActionForward;
import vo.Gongu;
import vo.PageInfo;
import gongu.svc.*;

public class AdminGonguListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		int loginAuthor = (int)session.getAttribute("loginAuthor");
		String[] filterArr = request.getParameterValues("gongu_status");
		//System.out.println(filterArr);
		String sOption = request.getParameter("search_option");
		String sKeyword = request.getParameter("search_keyword");

		
		//세션 로그인&권한체크
		if(loginId == null || loginId.equals("") || loginAuthor > 1) {
			//로그인 이동
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('권한이 없습니다. 다시 로그인해주세요');");
			out.print("location.href='adminLogin.ad';");
			out.print("</script>");
			
		}else {//권한이 있다면
			
			GonguListService gonguListService = new GonguListService(); // 서비스
			//리스트
			ArrayList<Gongu> gonguList = null;
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
				System.out.println("파라미터체크2"+page);
			}
			System.out.println("파라미터체크"+page);
			
			
					
			//검색체크 및 검색값 없음 -> 파라미터 null 
			if((sOption==null || sOption.equals("")) && (sKeyword == null || sKeyword.equals(""))) {
				sOption = null;
				sKeyword = null;
			}
			

			//2.글목록 가져오기
			/*
			switch(loginAuthor) {
			//관리자 권한이라면 모두 가져오기
			case 0: 
				listCount = gonguListService.getListCount(sOption,sKeyword,filterList);
				gonguList = gonguListService.getGonguList(sOption,sKeyword,filterList); 
				break;
					
			//판매자권한이라면 아이디와 일치하는 목록만 가져오기
			case 1:
				listCount = gonguListService.getListCount(loginId,sOption,sKeyword,filterList);
				gonguList = gonguListService.getGonguList(loginId,sOption,sKeyword,filterList); 
				break;
			
			}
			*/
			listCount = gonguListService.getListCount(loginId,loginAuthor,sOption,sKeyword,filterList);
			
			
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
			
			if(listCount>=0) {
				//공구목록
				gonguList = gonguListService.getGonguList(page,limit,loginId,loginAuthor,sOption,sKeyword,filterList);

				//순서로보는공구
				int standByCnt = gonguListService.gonguStandByCnt(loginId,loginAuthor);
				int ongoingCnt = gonguListService.gonguOngoindCnt(loginId,loginAuthor);
				int calcCnt = gonguListService.gonguCalcCnt(loginId,loginAuthor);
			

				request.setAttribute("pageInfo", pageInfo);
				request.setAttribute("sOption", sOption);
				request.setAttribute("sKeyword", sKeyword);
				request.setAttribute("filterList", filterList);
				request.setAttribute("standByCnt", standByCnt);
				request.setAttribute("ongoingCnt", ongoingCnt);
				request.setAttribute("calcCnt", calcCnt);
				request.setAttribute("gonguList", gonguList);//넘어가는 정보2
				request.setAttribute("pagefile", "/admin/adminGonguConfig.jsp");
				forward = new ActionForward("/admin/adminTemplate.jsp", false);// public ActionForward(String path, boolean redirect)
				
			}else{
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('공구목록조회에 실패했습니다. 다시 시도해주세요');");
				out.print("history.back();");
				out.print("</script>");
			}
		
		}
		return forward;

	}

}
