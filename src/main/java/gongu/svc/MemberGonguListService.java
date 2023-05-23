package gongu.svc;

import java.sql.Connection;
import java.util.HashMap;

import dao.GonguDAO;

import static db.JdbcUtil.*;
public class MemberGonguListService {

	public HashMap<Integer, String> getMemberGonguList(String member_id) {
		HashMap<Integer, String> gonguList = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			gonguList = gonguDAO.selectMemberGongu(member_id);
			
		}catch(Exception e) {
			System.out.println("문의등록공구옵션조회오류:"+e);
			
		}finally {
			close(con);
		}
		
		return gonguList;
	}

}
