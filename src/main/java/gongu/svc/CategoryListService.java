package gongu.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.GonguDAO;
import vo.Gongu;

public class CategoryListService {

	public ArrayList<Gongu> categoryList(String category) {
		Connection con = null;
		ArrayList<Gongu> categoryList = null;
		GonguDAO gonguDAO = GonguDAO.getInstance();
		try {
			con = getConnection();
			gonguDAO.setConnection(con);
			categoryList = gonguDAO.getCategoryList(category);			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return categoryList;
	}

}
