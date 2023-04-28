package gongu.svc;
import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.GonguDAO;
import vo.Gongu;

public class GonguListService {

	public ArrayList<Gongu> getGonguList() {
		ArrayList<Gongu> gonguList = null;
		//connection 객체
		Connection con = null;
		try {
			con = getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			gonguList = gonguDAO.selectGonguList();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		
		
		
		
		
		return gonguList;
	}

}
