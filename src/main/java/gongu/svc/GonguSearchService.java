package gongu.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.GonguDAO;
import vo.Gongu;

public class GonguSearchService {

	public ArrayList<Gongu> getSearchList(String search) {
		GonguDAO gonguDAO = GonguDAO.getInstance();
		Connection con = null;
		ArrayList<Gongu> searchList = null;
		try {
			con = getConnection();
			gonguDAO.setConnection(con);
			searchList = gonguDAO.getSearchList(search);
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(con);
		}
		return searchList;
		
	}

}
