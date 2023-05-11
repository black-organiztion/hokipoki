package gongu.svc;
import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.GonguDAO;
import vo.Gongu;

public class GonguViewService {

	public static Gongu getGonguView(int id) {
		Gongu gongu=null;
		Connection con=null;
		int viewcount = 0;
		
		try {
			con=getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			viewcount = gonguDAO.updateReadCount(id);
			if(viewcount>0) {
				commit(con);
				}			
			System.out.println("뷰카운트:"+viewcount);
			gongu=gonguDAO.selectgongu(id);
		}catch(Exception e) {			
			e.printStackTrace();
		}finally {
			close(con);
		}
		return gongu;
	}


}
