package member.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MemberDAO;
import vo.Member;

public class MemberIdCheckService {
	boolean idchkflag = false;
	Connection con = null;
	int insertCount;
	public boolean idChk(String id) {
		try {
			con=getConnection();
			MemberDAO memberDAO=MemberDAO.getInstance();
			memberDAO.setConnection(con);
			idchkflag = memberDAO.idcheckMember(id);		
			}catch(Exception e) {
			System.out.println("MemberidchkService에서 오류발생");
			e.printStackTrace();
			rollback(con);
		}finally {
			close(con);
		}
		return idchkflag;
	}
}
