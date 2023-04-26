package admin.svc;

import java.sql.Connection;

import dao.AdminDAO;
import vo.Seller;
import static db.JdbcUtil.*;

public class AdminLoginService {
	public Seller selectSeller(String seller_id, String seller_pw) {
		Seller seller = null;
		Connection con = null;
				
				try {
					con = getConnection();
					AdminDAO adminDAO = AdminDAO.getInstance();
					adminDAO.setConnection(con);
					  
					seller = adminDAO.selectSeller(seller_id, seller_pw); 
						
				}catch(Exception e){
					System.out.println("로그인실패 : "+e);
					
				}finally {
					close(con);
				}

		return seller;
	}

}
