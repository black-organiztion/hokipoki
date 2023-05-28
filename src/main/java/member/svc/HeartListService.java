package member.svc;

import java.sql.Connection;
import java.util.ArrayList;
import static db.JdbcUtil.*;
import dao.GonguDAO;
import vo.Gongu;

public class HeartListService {

	public ArrayList<Gongu> getList(String member_id) {
		ArrayList<Gongu> heartList = null;
		Connection con = null;
		
		try {
			con = getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			heartList = gonguDAO.getHeartList(member_id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		System.out.println(heartList.toString());
		return heartList;
	}

}
