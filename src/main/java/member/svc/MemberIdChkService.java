package member.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.MemberDAO;

public class MemberIdChkService {

	public boolean checkId(String userId) {
		boolean isDuplResult = false;
		Connection con = null;

		try {
			con = getConnection();
			MemberDAO memberDAO = MemberDAO.getInstance();
			memberDAO.setConnection(con);

			int resultCount = memberDAO.checkDupl(userId);

			if (resultCount > 0) {
				isDuplResult = false;
			} else {
				isDuplResult = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
		}

		return isDuplResult;
	}

}
