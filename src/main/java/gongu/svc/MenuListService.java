package gongu.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.GonguDAO;
import vo.Gongu;

public class MenuListService {

	public ArrayList<Gongu> getMenuList(String menu) {
		Connection con = null;
		ArrayList<Gongu> menuList = new ArrayList<Gongu>();
		GonguDAO gonguDAO = GonguDAO.getInstance();
		try {
			con = getConnection();
			gonguDAO.setConnection(con);
			menuList = gonguDAO.getMenuList(menu);			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return menuList;
		
		
	}

}
