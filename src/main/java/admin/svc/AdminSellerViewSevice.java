package admin.svc;

import java.sql.Connection;

import dao.AdminDAO;

import static db.JdbcUtil.*;
import vo.Seller;

public class AdminSellerViewSevice {

	public Seller getSellerView(String seller_id) {
		Seller seller = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			
			seller = adminDAO.selectSellerInfo(seller_id);
			
		}catch(Exception e) {
			System.out.println("판매자정보조회오류:"+e);
			
		}finally {
			close(con);
		}
		
		return seller;
	}

}
