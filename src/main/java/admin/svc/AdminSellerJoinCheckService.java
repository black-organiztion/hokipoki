package admin.svc;

import java.sql.Connection;

import dao.AdminDAO;

import static db.JdbcUtil.*;

public class AdminSellerJoinCheckService {

	public boolean setAuthor(String seller_id) {
		boolean authorResult = false;
		
		Connection con = null;
		
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			
			int authorCount = adminDAO.setSellerAuthor(seller_id);
			
			if(authorCount > 0) {
				authorResult = true;
				commit(con);
			}else {
				rollback(con);
			}
			
		}catch(Exception e) {
			System.out.println("판매자가입승인오류:"+e);
			rollback(con);
			
		}finally {
			close(con);
		}
		
		
		
		return authorResult;
	}

}
