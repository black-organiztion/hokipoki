package gongu.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import action.Action;
import gongu.svc.GonguListService;
import gongu.svc.MemberGonguListService;
import vo.ActionForward;

public class MemberGonguListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		return forward;
	}

	public String getGonguList(String member_id) {
		String result = null;
		
		//서비스객체생성
		MemberGonguListService memberGonguListService = new MemberGonguListService();
		
		HashMap<Integer,String> gonguList = null;
		
		gonguList = memberGonguListService.getMemberGonguList(member_id);
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		try {
			result = objectMapper.writeValueAsString(gonguList);
			
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		System.out.println(result);
		
		return result;
	}

}
