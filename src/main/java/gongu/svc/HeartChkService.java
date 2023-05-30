package gongu.svc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.GonguDAO;

public class HeartChkService {

	public boolean heartChk(String member_id, int id) {
		Connection con = null;
		boolean heartChk = false;
		try {
			con=getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			heartChk = gonguDAO.heartChk(member_id,id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return heartChk;
	}

}
