package gongu.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import gongu.svc.GonguRegistService;
import vo.ActionForward;
import vo.Gongu;
import vo.Gongu_imgfile;

public class GonguRegistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String saveFolder = "/gongu/images";//넘어오는 이미지 파일 저장 경로
		String encoding = "utf-8";
		int maxSize = 10*1024*1024; //10MB		
		
		String realFolder = 
				request.getServletContext().getRealPath(saveFolder);
		System.out.println("realFolder"+realFolder);
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encoding, new DefaultFileRenamePolicy());
		
		HttpSession session = request.getSession();
		String seller_id= (String)session.getAttribute("loginId");		
	
		Gongu gongu = new Gongu();	
		 
		gongu.setSeller_id(seller_id);
		gongu.setCategory(multi.getParameter("category"));
		gongu.setGongu_name(multi.getParameter("gonguname"));
		gongu.setGongu_price(multi.getParameter("originprice"));		
		gongu.setGongu_view_count(0);
		gongu.setGongu_discount_price(multi.getParameter("gonguprice"));
		gongu.setGongu_startdate(multi.getParameter("gongustart"));
		gongu.setGongu_findate(multi.getParameter("gongufinish"));
		gongu.setGongu_stock(multi.getParameter("gongustock"));
		gongu.setGongu_reserve("0");
		gongu.setGongu_min(multi.getParameter("minGongu"));
		gongu.setGongu_caldate(multi.getParameter("caldate"));
		gongu.setDetail_img(multi.getFilesystemName("image"));
		gongu.setGongu_caldate(multi.getParameter("caldate"));
		gongu.setThumbnail_img(multi.getFilesystemName("nailimage"));
		
		
		System.out.println("action에서 생성된 gongu객체 :"+gongu);
		
		GonguRegistService GonguRegistService = new GonguRegistService();
		boolean isRegistSuccess = GonguRegistService.isRegistSuccess(gongu);
		if(isRegistSuccess) {
			forward = new ActionForward("/hokipoki/adminGonguListAction.ad",true);
			}else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			/* out.println("history"); */
			out.println("</script>");
			
		}
		
		return forward;
	}

}
