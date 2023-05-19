package admin.svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.AdminDAO;
import vo.Seller;
import static db.JdbcUtil.*;

public class AdminSellerListService {
	public int getListCount(String loginId, int loginAuthor, String sOption, String sKeyword) {
		int listCount = 0;
		
		Connection con = null;
		
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			
			listCount = adminDAO.selectSellerListCount(loginId,loginAuthor,sOption,sKeyword);
			
		}catch(Exception e){
			System.out.println("판매자개수조회오류:"+e);
			
		}finally {
			close(con);
		}
		
		return listCount;
	}

	public ArrayList<Seller> getSellerList(int page, int limit, String loginId, int loginAuthor, String sOption,
			String sKeyword) {
		
		ArrayList<Seller> sellerList = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			
			sellerList = adminDAO.selectSellerList(page,limit,loginId,loginAuthor,sOption,sKeyword);
			
		}catch(Exception e){
			System.out.println("판매자목록조회오류:"+e);
			
		}finally {
			close(con);
		}
		
		return sellerList;
	}

	public int sellerStandByCnt(String loginId, int loginAuthor) {
		int standByCount = 0;
		
		Connection con = null;
		
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			
			standByCount = adminDAO.selectStandByCnt(loginId,loginAuthor);
			
		}catch(Exception e){
			System.out.println("판매자목록조회오류:"+e);
			
		}finally {
			close(con);
		}
		
		return standByCount;
	}
}
