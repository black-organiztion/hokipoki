package gongu.svc;


import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.GonguDAO;
import vo.Gongu;
import vo.Gongu_imgfile;

public class GonguRegistService {

	public boolean isRegistSuccess(Gongu gongu) {
		boolean isregistSuccess= false; 
		Connection con = null;
		try {
			con=getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			int insertCount = gonguDAO.insertGongu(gongu);
			if(insertCount>0) {
				commit(con);
				isregistSuccess = true;				
			}else {
				rollback(con);
			}						
			
		}catch(Exception e) {
			e.printStackTrace();
			rollback(con);
		}finally {
			close(con);
		}
		
		
		
		
		
		return isregistSuccess;
	}

}
