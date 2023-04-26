package member.svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.MemberDAO;
import vo.Member;

public class MemberJoinService {
	boolean joinsuccess = false;
	Connection con = null;
	int insertCount;
	public boolean joinMember(Member member) {
		try {
			con=getConnection();
			MemberDAO memberDAO=MemberDAO.getInstance();
			memberDAO.setConnection(con);
			insertCount = memberDAO.insertMember(member);
			if(insertCount>0) {
				joinsuccess = true;
				commit(con);
				}
			}catch(Exception e) {
			System.out.println("MemberJoinService에서 오류발생");
			e.printStackTrace();
			rollback(con);
		}finally {
			close(con);
		}
		return joinsuccess;
	}

}
