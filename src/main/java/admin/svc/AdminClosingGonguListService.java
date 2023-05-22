package admin.svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.GonguDAO;
import vo.Gongu;
import static db.JdbcUtil.*;

public class AdminClosingGonguListService {

	public ArrayList<Gongu> getClosingList() {
		ArrayList<Gongu> gonguList = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			gonguList = gonguDAO.seletClosingGonguList();
			
		}catch(Exception e) {
			System.out.println("마감임박공구조회오류:"+e);
			
		}finally {
			close(con);
		}
		
		return gonguList;
	}

}
