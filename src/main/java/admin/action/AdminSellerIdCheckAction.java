package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import admin.svc.AdminSellerDuplicateCheckService;
import vo.ActionForward;

public class AdminSellerIdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		return forward;
	}
	
	public String checkId(String checkId) {
		String result = null;
		
		String seller_id = checkId;
		
		//System.out.println("ajax에서 전송한 값 : "+seller_id); 
		
		AdminSellerDuplicateCheckService adminSellerDuplicateCheckService = new AdminSellerDuplicateCheckService();
		
		boolean isDuplResult = adminSellerDuplicateCheckService.checkId(seller_id);

		if(isDuplResult) {
			result = "Avaliable";
			System.out.println("아이디중복안됨 "+result);
		}else {
			result = "duplicate";
			System.out.println("아이디중복됨 "+result);
		}
		
		
		return result;
	}

}
