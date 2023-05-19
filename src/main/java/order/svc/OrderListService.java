package order.svc;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dao.OrderDAO;
import vo.MemberOrder;
import static db.JdbcUtil.*;

public class OrderListService {
	public List<Object> getOrderList(String loginId, int loginAuthor) {
		List<Object> orderList = null;
		
		Connection con = null;
		
		try{
			con = getConnection();
			OrderDAO orderDAO = OrderDAO.getInstance();
			orderDAO.setConnection(con);
			
			orderList = orderDAO.selectOrderList(loginId,loginAuthor);
			
			
		}catch(Exception e) {
			System.out.println("주문목록조회오류 : "+e);
			
		}finally {
			close(con);
		}
		
		
		return orderList;
	}


	public int getListCount(String loginId, int loginAuthor, String sOption, String sKeyword,
			ArrayList<String> filterList) {

		int listCount = 0;
		
		Connection con = null;
		
		try {
			con = getConnection();
			OrderDAO orderDAO = OrderDAO.getInstance();
			orderDAO.setConnection(con);
			
			listCount = orderDAO.selectListCount(loginId,loginAuthor,sOption,sKeyword,filterList);
			
		}catch(Exception e) {
			System.out.println("주문개수조회오류:"+e);
			
		}finally {
			close(con);
		}
	
		
		return listCount;

	}

	public List<Object> getOrderList(int page, int limit, String loginId, int loginAuthor, String sOption,
			String sKeyword, ArrayList<String> filterList) {
		
		List<Object> orderList = null;
		
		Connection con = null;
		
		try{
			con = getConnection();
			OrderDAO orderDAO = OrderDAO.getInstance();
			orderDAO.setConnection(con);
			
			orderList = orderDAO.selectOrderList(page, limit, loginId, loginAuthor, sOption, sKeyword, filterList);
			
			
		}catch(Exception e) {
			System.out.println("주문목록조회오류 : "+e);
			
		}finally {
			close(con);
		}
		
		
		return orderList;
	}

}
