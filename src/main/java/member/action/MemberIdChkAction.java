package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import admin.svc.AdminSellerDuplicateCheckService;
import admin.svc.AdminSellerIdentifyCheckService;
import member.svc.MemberIdChkService;
import vo.ActionForward;

public class MemberIdChkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward  = null;
		return forward;
	}
	
	public String checkId(String Id) {
		String result = null;		
		String userId = Id;
		boolean flag = false;
		System.out.println("넘어온 아이디 :"+Id);
		
		
		MemberIdChkService memberIdChkService = new MemberIdChkService();
		
		flag = memberIdChkService.checkId(userId);
		System.out.println("flag="+flag);
		
		if(flag) {
			result = "Avaliable";
			System.out.println("아이디중복안됨 "+result);
		}else {
			result = "duplicate";
			System.out.println("아이디중복됨 "+result);
		}
		
		
		return result;
	}

	
	
}
