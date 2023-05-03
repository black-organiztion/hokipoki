package member.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.MemberDAO;
import vo.Member;

public class MyInfoService {

	public Member showMyInfo(String id) {
		Member member = null;
		boolean flag=false;
		Connection con = null;
		try {
			con = getConnection();
			MemberDAO memberDAO = MemberDAO.getInstance();
			memberDAO.setConnection(con);
			
			member = memberDAO.returnMember(id);		
			
			
		}catch(Exception e) {			
			System.out.println("showmyInfo에서 오류");
			e.printStackTrace();
			
		}finally {
			close(con);
		}
		
		return member;
	}

}
