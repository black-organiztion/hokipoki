package admin.svc;

import java.sql.Connection;

import dao.AdminDAO;
import vo.Seller;
import static db.JdbcUtil.*;

public class AdminJoinService {

	public boolean insertSeller(Seller seller) {
		
		boolean joinResult = false;
		
		Connection con = null;
		
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance(); 
			adminDAO.setConnection(con);
			
			int insertCount = adminDAO.insertSeller(seller);
			
			if(insertCount > 0) {
				joinResult = true;
				commit(con);
				
			}else {
				rollback(con);
			}
			
			
		}catch(Exception e){
			System.out.println("판매자 회원가입 실패 : "+e);
			rollback(con);
			
		}finally {
			close(con);
		}
		
		
		return joinResult;
	}

}
