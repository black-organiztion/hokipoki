package order.svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDAO;
import vo.MemberOrder;
import static db.JdbcUtil.*;

public class OrderListService {

	public ArrayList<MemberOrder> getOrderList(String loginId, int loginAuthor) {
		ArrayList<MemberOrder> orderList = null;
		
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

}
