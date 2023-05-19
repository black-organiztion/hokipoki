package admin.svc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dao.AdminDAO;
import dao.OrderDAO;
import vo.Member;

import static db.JdbcUtil.*;

public class AdminMemberListService {

	public int getListCount(String loginId, int loginAuthor, String sOption, String sKeyword) {
		int listCount = 0;
		
		Connection con = null;
		
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			
			listCount = adminDAO.selectMemberListCount(loginId,loginAuthor,sOption,sKeyword);
			
		}catch(Exception e) {
			System.out.println("회원개수조회오류:"+e);
			
		}finally {
			close(con);
		}
	
		
		return listCount;
	}

	public ArrayList<Member> getMemberList(int page, int limit, String loginId, int loginAuthor, String sOption,
			String sKeyword) {
		
		ArrayList<Member> memberList = new ArrayList<>();
		
		Connection con = null;
		
		try{
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			
			memberList = adminDAO.selectMemberList(page, limit, loginId, loginAuthor, sOption, sKeyword);
			
			
		}catch(Exception e) {
			System.out.println("멤버목록조회오류 : "+e);
			
		}finally {
			close(con);
		}
		
		
		return memberList;
	}

}
