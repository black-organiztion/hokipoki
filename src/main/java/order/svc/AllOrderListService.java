package order.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDAO;
import vo.MemberOrderGongu;

public class AllOrderListService {

	public ArrayList<MemberOrderGongu> allOrderList(String id) {
		ArrayList <MemberOrderGongu> allOrderList = null;
		Connection con = null;
		
		try {
			con = getConnection();
			OrderDAO orderDAO = OrderDAO.getInstance();
			orderDAO.setConnection(con);
			allOrderList = orderDAO.allMemberOrderList(id);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return allOrderList;
	}
	
}
