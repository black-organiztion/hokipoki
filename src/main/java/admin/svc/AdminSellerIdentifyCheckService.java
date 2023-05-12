package admin.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.AdminDAO;

public class AdminSellerIdentifyCheckService {

	public boolean checkIdentify(String seller_id, String seller_pw) {
		boolean isIdentifyResult = false;
				
		Connection con = null;
		
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			
			int resultCount = adminDAO.checkIdentify(seller_id,seller_pw);
			
			if(resultCount > 0) {
				isIdentifyResult = true;
			}else {
				isIdentifyResult = false;
			}
			
		}catch(Exception e) {
			System.out.println("판매자본인확인체크오류:"+e);
		}finally {
			close(con);
		}
		
		return isIdentifyResult;
	}

}
