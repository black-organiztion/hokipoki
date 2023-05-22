package admin.svc;

import java.sql.Connection;

import dao.GonguDAO;
import vo.Gongu;
import static db.JdbcUtil.*;

public class AdminGonguDetailViewService {

	public Gongu getGongu(int gongu_id) {
		Gongu gongu = null;
		
		Connection con= null;
		
		try {
			con=getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);

			gongu=gonguDAO.selectgongu(gongu_id);
			
		}catch(Exception e) {
			System.out.println("공구정보조회오류:"+e);
			
		}finally {
			close(con);
		}
		
		
		return gongu;
	}

}
