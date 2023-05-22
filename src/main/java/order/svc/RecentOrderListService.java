package order.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDAO;
import vo.MemberOrderGongu;

public class RecentOrderListService {

	public ArrayList<MemberOrderGongu> getRecentOrderList(String id) {
		ArrayList<MemberOrderGongu> OrderList = null;
		Connection con = null;
		try {
			con=getConnection();
			OrderDAO orderDAO = OrderDAO.getInstance();
			orderDAO.setConnection(con);
			OrderList = orderDAO.recentMemberOrderList(id);
			
		}catch(Exception e) {
			e.printStackTrace();			
		}finally {
			close(con);
		}
		
		return OrderList;
	}

}
