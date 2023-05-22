package order.svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDAO;

import static db.JdbcUtil.*;
import vo.MemberOrder;

public class RecentOrderListService {

	public ArrayList<MemberOrder> getRecentOrderList(String id) {
		ArrayList<MemberOrder> OrderList = null;
		Connection con = null;
		try {
			con=getConnection();
			OrderDAO orderDAO = OrderDAO.getInstance();
			orderDAO.setConnection(con);
			OrderList = orderDAO.selectMemberOrderList(id);
			
		}catch(Exception e) {
			e.printStackTrace();			
		}finally {
			close(con);
		}
		
		return OrderList;
	}

}
