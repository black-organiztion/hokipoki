package gongu.svc;

import java.sql.Connection;

import dao.GonguDAO;

import static db.JdbcUtil.*;

public class AdminGonguDeleteService {

	public boolean deleteGongu(String gongu_id) {
		boolean isSuccess = false;
		
		Connection con = null;
		
		try {
			con = getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			int deleteCount = gonguDAO.deleteGongu(gongu_id);
			
			if(deleteCount > 0) {
				isSuccess = true;
				commit(con);
				
			}else {
				rollback(con);
			}
			
		}catch(Exception e) {
			System.out.println("판매자공구삭제오류:"+e);
			rollback(con);
			
		}finally {
			close(con);
		}
		
		return isSuccess;
	}

}
