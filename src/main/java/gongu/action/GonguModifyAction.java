package gongu.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import gongu.svc.GonguModifyService;
import vo.ActionForward;
import vo.Gongu;

public class GonguModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		//파라미터처리
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		int loginAuthor = (int)session.getAttribute("loginAuthor");
		
		
		//세션 로그인&권한체크
		if(loginId == null || loginId.equals("") || loginAuthor>1) {
			//로그인 이동
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('권한이 없습니다. 다시 로그인해주세요');");
			out.print("location.href='adminLogin.ad';");
			out.print("</script>");
			
		}else {
			
			String saveFolder = "/gongu/images"; //넘어오는 이미지 파일 저장 경로
			String encoding = "utf-8";
			int maxSize = 10*1024*1024; //10MB
			String realFolder = request.getServletContext().getRealPath(saveFolder);
			
			MultipartRequest multi = new MultipartRequest(request,realFolder,maxSize,encoding,new DefaultFileRenamePolicy());			
			
			String seller_id = multi.getParameter("seller_id");
			
			Gongu gongu = new Gongu();	
			
			gongu.setGongu_id(Integer.parseInt(multi.getParameter("gongu_id"))); //공구ID
			gongu.setCategory(multi.getParameter("category")); //카테고리
			gongu.setGongu_status(multi.getParameter("gongu_status")); //공구상태
			gongu.setGongu_name(multi.getParameter("gonguname")); //공구명
			gongu.setGongu_price(multi.getParameter("originprice"));	 //정가
			gongu.setGongu_discount_price(multi.getParameter("gonguprice")); //공구가격
			 //등록일시
			gongu.setGongu_startdate(multi.getParameter("gongustart")); //판매시작일
			gongu.setGongu_findate(multi.getParameter("gongufinish")); //판매종료일
			gongu.setGongu_stock(multi.getParameter("gongustock")); //재고수
			gongu.setGongu_min(multi.getParameter("minGongu")); //최소목표수
			gongu.setGongu_caldate(multi.getParameter("caldate")); //계산마감일
			gongu.setDetail_img(multi.getFilesystemName("image")); //상세정보
			gongu.setThumbnail_img(multi.getFilesystemName("nailimage")); //썸네일

			
			//서비스
			GonguModifyService gonguModifyService = new GonguModifyService();
			
			//수정성공여부
			boolean isModifySuccess = gonguModifyService.modifyGongu(gongu);
			
			
			if(isModifySuccess) {//수정성공
				forward = new ActionForward("/adminGonguDetailViewAction.ad?gongu_id="+gongu.getGongu_id()+"&seller_id="+seller_id, false);
				
			}else {//수정실패
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('공구수정에 실패했습니다. 다시 시도해주세요');");
				out.print("history.back();");
				out.print("</script>");
			}
		}
		
		
		return forward;
	}

}
