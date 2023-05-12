package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import admin.svc.AdminSellerDuplicateCheckService;
import admin.svc.AdminSellerIdentifyCheckService;
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

	
	public String checkPass(String id, String pw) {
		String result = null;
		String seller_id = id;
		String seller_pw = pw;
		
		AdminSellerIdentifyCheckService adminSellerIdentifyCheckService = new AdminSellerIdentifyCheckService();
		
		boolean isIdentifyResult = adminSellerIdentifyCheckService.checkIdentify(seller_id, seller_pw);

		if(isIdentifyResult) {
			result = "Avaliable";
			System.out.println("비밀번호 일치 "+result);
		}else {
			result = "duplicate";
			System.out.println("비밀번호 불일치 "+result);
		}
		
		
		return result;
	}

}
