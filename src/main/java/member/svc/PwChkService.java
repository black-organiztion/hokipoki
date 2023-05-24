package member.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.MemberDAO;

public class PwChkService {

	public boolean PwChk(String pw,String id) {
		Connection con = null;
		boolean flag = false;
		MemberDAO memberDAO = MemberDAO.getInstance();
		try {
			con=getConnection();
			memberDAO.setConnection(con);
			flag = memberDAO.pwchk(pw,id);	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return flag;
	}

}
