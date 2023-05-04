package gongu.svc;

import java.sql.Connection;

import dao.GonguDAO;
import vo.Gongu;
import static db.JdbcUtil.*;

public class GonguModifyService {

	public boolean modifyGongu(Gongu gongu) {
		boolean modifyResult = false;
		
		Connection con = null;
		
		try {
			con = getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			int modifyCount = gonguDAO.updateGongu(gongu);
			
			if(modifyCount > 0) {
				System.out.println("공구수정성공:"+modifyCount+"건");
				modifyResult = true;
				commit(con);
			}else {
				rollback(con);
			}
			
		}catch(Exception e) {
			System.out.println("공구수정오류:"+e);
			rollback(con);
			
		}finally {
			close(con);
		}
		
		return modifyResult;
	}

}
