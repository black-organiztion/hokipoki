package member.svc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.MemberDAO;

public class IdCheckService {

	public boolean dupCheck(String id) {

		Connection con = null;
		boolean flag = false;
		try {
			con = getConnection();
			MemberDAO memberDAO =MemberDAO.getInstance();
			memberDAO.setConnection(con);
			flag=memberDAO.dupIdCheck(id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return flag;

	}

}
