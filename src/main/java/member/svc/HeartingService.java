package member.svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.MemberDAO;

public class HeartingService {

	public boolean insertHeart(String member_id, int gongu_id) {
		boolean flag = false;
		Connection con = null;
		try {
			con=getConnection();
			MemberDAO memberDAO = MemberDAO.getInstance();
			memberDAO.setConnection(con);
			
			flag = memberDAO.insertHeart(member_id,gongu_id);
			if(flag) {
				commit(con);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(con);
		}
		
		return flag;
		
	}

}
