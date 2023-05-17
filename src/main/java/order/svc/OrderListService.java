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

	public List<Object> getOrderList(String loginId, int loginAuthor, ArrayList<String> filterList) {
		List<Object> orderList = null;
		
		Connection con = null;
		
		try{
			con = getConnection();
			OrderDAO orderDAO = OrderDAO.getInstance();
			orderDAO.setConnection(con);
			
			orderList = orderDAO.selectOrderList(loginId,loginAuthor,filterList);
			
			
		}catch(Exception e) {
			System.out.println("주문목록조회오류 : "+e);
			
		}finally {
			close(con);
		}
		
		
		return orderList;
	}

}
