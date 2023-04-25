package member.svc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.MemberDAO;
import vo.Member;

public class MemberLoginService {

	public boolean login(Member member) {
		Connection con = null;
		boolean flag = false;
		try {
			con=getConnection();
			MemberDAO memberDAO = MemberDAO.getInstance();
			memberDAO.setConnection(con);	

			String loginId = memberDAO.selectLogin(member);
			if (loginId != null) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
		}

		return flag;
	}

}
