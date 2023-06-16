package order.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.HashMap;

import dao.OrderDAO;

public class MemberOrderListService {

	public HashMap<Integer, String> getMemberOrderList(String member_id) {
		HashMap<Integer, String> orderList = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			OrderDAO orderDAO = OrderDAO.getInstance();
			orderDAO.setConnection(con);
			
			orderList = orderDAO.selectMemberOrder(member_id);
			
		}catch(Exception e) {
			System.out.println("문의등록문의옵션조회오류:"+e);
			
		}finally {
			close(con);
		}
		
		return orderList;
	}

}
