package admin.svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDAO;

import static db.JdbcUtil.*;

import vo.MemberOrder;

public class AdminMemberOrderListService {

	public ArrayList<MemberOrder> getMemberOrderList(String member_id) {
		ArrayList<MemberOrder> memberOrderList = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			OrderDAO orderDAO = OrderDAO.getInstance();
			orderDAO.setConnection(con);
			
			memberOrderList = orderDAO.selectMemberOrderList(member_id);
			
		}catch(Exception e) {
			System.out.println("회원주문목록조회오류:"+e);
			
			
		}finally {
			close(con);
		}
		
		return memberOrderList;
	}

}
