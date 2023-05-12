package admin.svc;

import java.sql.Connection;

import dao.AdminDAO;

import static db.JdbcUtil.*;

public class AdminSellerDuplicateCheckService {

	public boolean checkId(String seller_id) {
		boolean isDuplResult = false;
		
		Connection con = null;
		
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			
			int resultCount = adminDAO.checkDupl(seller_id);
			
			if(resultCount > 0) {
				isDuplResult = false;
			}else {
				isDuplResult = true;
			}
			
		}catch(Exception e) {
			System.out.println("판매자아이디중복체크오류:"+e);
		}finally {
			close(con);
		}
		
		return isDuplResult;
	}

}
