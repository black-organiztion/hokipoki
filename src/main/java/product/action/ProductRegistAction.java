package product.action;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import product.svc.ProductRegistService;
import vo.ActionForward;
import vo.Product;

public class ProductRegistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String saveFolder = "/product/images";//넘어오는 이미지 파일 저장 경로
		String encoding = "utf-8";
		int maxSize = 10*1024*1024; //10MB
		
		String realFolder = 
				request.getServletContext().getRealPath(saveFolder);
		System.out.println("realFolder"+realFolder);
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encoding, new DefaultFileRenamePolicy());
				

		int i =0;
		i++;
		Product product = new Product();		
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String now_dt = format.format(now);
		System.out.println("now_dt:"+now_dt);
		
		product.setProduct_id(i);
		product.setCategory(multi.getParameter("category"));
		product.setProduct_name(multi.getParameter("productname"));
		product.setProduct_price(multi.getParameter("originprice"));
		product.setProduct_date(now_dt);
		product.setProdcut_view_count(0);
		product.setProduct_discount_price(multi.getParameter("shareprice"));
		product.setProduct_startdate(now_dt);
		product.setProduct_findate(now_dt);
		product.setProduct_stock(multi.getParameter("productstock"));
		product.setProduct_reserve("1");
		product.setProduct_min(multi.getParameter("minproduct"));
		product.setProduct_caldate(multi.getParameter("caldate"));
		
		
		ProductRegistService productRegistService = new ProductRegistService();
		boolean isRegistSuccess = productRegistService.isRegistSuccess(product);
		if(isRegistSuccess) {
			forward = new ActionForward("dogList.dog",true);
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
