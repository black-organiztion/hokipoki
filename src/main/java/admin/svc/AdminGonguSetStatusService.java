package admin.svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.GonguDAO;

import static db.JdbcUtil.*;

public class AdminGonguSetStatusService {

	public boolean setNextStatus(int gongu_id, String nextStatus) {
		boolean nextResult = false;
		
		Connection con = null;
		
		try {
			con = getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			
			int updateCount = gonguDAO.updateGonguStatus(gongu_id, nextStatus);

			if(updateCount > 0) {
				nextResult = true;
				commit(con);
				
			}else {
				rollback(con);
			}
			
			
		}catch(Exception e) {
			System.out.println("공구상태변경오류:"+e);
			rollback(con);
			
		}finally {
			close(con);
		}
		
		
		return nextResult;
	}

	public ArrayList<String[]> startGonguAll() {
		ArrayList<String[]> startList = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			//System.out.println(con);
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			startList = gonguDAO.startGongu();

			if(startList.size() > 0) {
				commit(con);
				
			}else {
				rollback(con);
			}
			
			
		}catch(Exception e) {
			System.out.println("공구진행시작오류:"+e);
			e.printStackTrace();
			rollback(con);
			
		}finally {
			close(con);
		}
		
		return startList;
	}

	public ArrayList<String[]> closeGonguAll() {
		ArrayList<String[]> closeList = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			//System.out.println(con);
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			closeList = gonguDAO.closeGongu();

			if(closeList.size() > 0) {
				commit(con);
				
			}else {
				rollback(con);
			}
			
			
		}catch(Exception e) {
			System.out.println("공구종료오류:"+e);
			e.printStackTrace();
			rollback(con);
			
		}finally {
			close(con);
		}
		
		return closeList;
	}

}
