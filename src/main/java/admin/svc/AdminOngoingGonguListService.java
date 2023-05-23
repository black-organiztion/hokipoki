package admin.svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.GonguDAO;

import static db.JdbcUtil.*;
import vo.Gongu;

public class AdminOngoingGonguListService {

	public ArrayList<Gongu> getOngoingList(String loginId, int loginAuthor) {
		ArrayList<Gongu> gonguList = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			gonguList = gonguDAO.selectOnGoingList(loginId);
			
		}catch(Exception e) {
			System.out.println("판매자진행중공구조회오류:"+e);
			
		}finally {
			close(con);
		}
		
		return gonguList;
	}

}
