package admin.svc;

import java.sql.Connection;

import dao.AdminDAO;

import static db.JdbcUtil.*;
import vo.Seller;

public class AdminMyPageService {

	public Seller showMyInfo(String loginId) {
		Seller seller = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			
			seller = adminDAO.selectSellerInfo(loginId);
			
		}catch(Exception e) {
			System.out.println("관리자내정보조회오류:"+e);
			
		}finally {
			close(con);
		}
		
		return seller;
	}
	
}
