package admin.svc;

import java.sql.Connection;

import dao.AdminDAO;
import vo.Seller;
import static db.JdbcUtil.*;
public class AdminSellerUpdateService {

	public boolean modifySeller(Seller seller) {
		boolean updateResult = false;
		
		Connection con = null;
		
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			int updateCount = adminDAO.updateSeller(seller);
			
			if(updateCount > 0) {
				updateResult = true;
				commit(con);
			}else {
				rollback(con);
			}
			
		}catch(Exception e) {
			System.out.println("판매자정보수정오류:"+e);
			rollback(con);
			
		}finally {
			close(con);
		}
		
		
		return updateResult;
	}

}
