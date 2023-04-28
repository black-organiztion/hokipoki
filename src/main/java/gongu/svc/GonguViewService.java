package gongu.svc;
import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.GonguDAO;
import vo.Gongu;

public class GonguViewService {

	public static Gongu getGonguView(int id) {
		Gongu gongu=null;
		Connection con=null;
		try {
			con=getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			gongu=gonguDAO.selectgongu(id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return gongu;
	}


}
