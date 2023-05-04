package gongu.svc;
import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.GonguDAO;
import vo.Gongu;

public class GonguListService {
	//관리자 : 매개값없이 모든 공구 리스트 가져오기
	public ArrayList<Gongu> getGonguList() {
		ArrayList<Gongu> gonguList = null;
		//connection 객체
		Connection con = null;
		try {
			con = getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			gonguList = gonguDAO.selectGonguList();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return gonguList;
	}
	
	//판매자 : 판매자아이디 매개값으로 공구리스트 가져오기
	public ArrayList<Gongu> getGonguList(String loginId) {
		ArrayList<Gongu> gonguList = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			gonguList = gonguDAO.selectGonguList(loginId);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			close(con);
		}
		
		return gonguList;
	}

}
