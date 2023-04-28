package order.svc;

import java.sql.Connection;
import java.util.Map;

import dao.OrderDAO;

import static db.JdbcUtil.*;

public class OrderDetailViewService {

	public Map<String, Object> getOrderDetail(String loginId, int loginAuthor, int order_id) {
		Map<String,Object> order = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			OrderDAO orderDAO = OrderDAO.getInstance();
			orderDAO.setConnection(con);
			
			order = orderDAO.selectOrder(loginId, loginAuthor, order_id);
			
		}catch(Exception e) {
			System.out.println("주문상세조회오류:"+e);
			
		}finally {
			close(con);
		}
		
		return order;
	}

}
