package order.svc;

import dao.GonguDAO;
import dao.OrderDAO;
import static db.JdbcUtil.*;
import java.sql.Connection;

public class MemberPaymentService {

	public boolean paymentProcess(String gongu_id, String member_id, int delivery_id) {
		Connection con  = null;
		boolean orderResult = false;
		try {
			con = getConnection();
			OrderDAO orderDAO = OrderDAO.getInstance();
			
			orderDAO.setConnection(con);     
			
			                                                                
			orderResult= orderDAO.insertToOrder(gongu_id, member_id, delivery_id);	
			System.out.println(orderResult);
			if(orderResult) {				
				commit(con);
				return true;
			}
		}catch(Exception e) {
			rollback(con);
			System.out.println("MemberPaymentService에서 오류발생");
			e.printStackTrace();			
		}	finally {
			close(con);
		}
		return false;
		
	}

	

}
