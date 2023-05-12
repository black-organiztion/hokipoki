package gongu.svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.GonguDAO;

import static  db.JdbcUtil.*;

import vo.Gongu;

public class HomeGonguListService {

	public ArrayList<Gongu> getPopularList() {
		Connection con = null;
		ArrayList<Gongu> popularList = new ArrayList<Gongu>();
		GonguDAO gonguDAO = GonguDAO.getInstance();
		try {
			con = getConnection();
			gonguDAO.setConnection(con);
			popularList = gonguDAO.getPopularList();			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return popularList;
	}

	public ArrayList<Gongu> getNewList() {
		Connection con = null;
		ArrayList<Gongu> newList = new ArrayList<Gongu>();
		GonguDAO gonguDAO = GonguDAO.getInstance();
		try {
			con = getConnection();
			gonguDAO.setConnection(con);
			newList = gonguDAO.getNewList();			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return newList;
	}

	public ArrayList<Gongu> getOldList() {
		Connection con = null;
		ArrayList<Gongu> oldList = new ArrayList<Gongu>();
		GonguDAO gonguDAO = GonguDAO.getInstance();
		try {
			con = getConnection();
			gonguDAO.setConnection(con);
			oldList = gonguDAO.getOldList();			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return oldList;
	}

}
