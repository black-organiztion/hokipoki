package admin.svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.AdminDAO;
import vo.Seller;
import static db.JdbcUtil.*;

public class AdminSellerListService {
	public ArrayList<Seller> getSellerList() {
		ArrayList<Seller> sellerList = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			
			sellerList = adminDAO.selectSellerList();
			
		}catch(Exception e){
			System.out.println("판매자리스트 오류:"+e);
			
		}finally {
			close(con);
		}
		
		
		
		return sellerList;
	}
}
