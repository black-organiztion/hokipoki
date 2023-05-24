package admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import admin.svc.AdminSellerListService;
import vo.ActionForward;
import vo.PageInfo;
import vo.Seller;

public class AdminSellerListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
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
			//파라미터처리
			String loginId = (String)session.getAttribute("loginId");
			int loginAuthor = (int)session.getAttribute("loginAuthor");
			String sOption = request.getParameter("search_option");
			String sKeyword = request.getParameter("search_keyword");
			
			//판매자 리스트 가져오기(정렬순서  99->1, 오름차순)
			//서비스
			AdminSellerListService adminSellerListService = new AdminSellerListService();
			
			ArrayList<Seller> sellerList = null;
			
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
			

			//검색체크 및 검색값 없음 -> 파라미터 null 
			if((sOption==null || sOption.equals("")) && (sKeyword == null || sKeyword.equals(""))) {
				sOption = null;
				sKeyword = null;
			}
			
			listCount = adminSellerListService.getListCount(loginId,loginAuthor,sOption,sKeyword);
			
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
			
			int standByCnt = adminSellerListService.sellerStandByCnt(loginId,loginAuthor);
			
			
			if(listCount >= 0) {
				sellerList = adminSellerListService.getSellerList(page,limit,loginId,loginAuthor,sOption,sKeyword);
				
				request.setAttribute("pageInfo", pageInfo);
				request.setAttribute("standByCnt", standByCnt);
				request.setAttribute("sellerList", sellerList);
				request.setAttribute("pagefile", "/admin/adminSellerConfig.jsp");
				forward = new ActionForward("/admin/adminTemplate.jsp",false);
			}
		}
		
		return forward;
	}

}
