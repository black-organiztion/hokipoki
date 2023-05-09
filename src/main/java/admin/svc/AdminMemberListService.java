package admin.svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.AdminDAO;
import vo.Member;

import static db.JdbcUtil.*;

public class AdminMemberListService {

	public ArrayList<Member> getMemberList() {
		ArrayList<Member> memberList = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			
			memberList = adminDAO.selectMemberList();
			
		}catch(Exception e) {
			System.out.println("회원목록조회오류:"+e);
			
		}finally {
			close(con);
		}
		
		return memberList;
	}

}
