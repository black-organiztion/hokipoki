package gongu.svc;

import java.sql.Connection;

import dao.GonguDAO;

import static db.JdbcUtil.*;

public class GonguReserveUpdateService {

	public boolean updateReserve(String gongu_id) {
	boolean flag = false;
	Connection con = null;
	try {
		con=getConnection();
		GonguDAO gonguDAO = GonguDAO.getInstance();
		gonguDAO.setConnection(con);
		
		int updateReserve = gonguDAO.updateReserveCount(gongu_id);
		if(updateReserve>0) {
			flag=true;
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	
	
	return flag;
	
	}

}
