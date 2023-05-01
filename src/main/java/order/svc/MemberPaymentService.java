package order.svc;

import dao.OrderDAO;
import static db.JdbcUtil.*;
import java.sql.Connection;

public class MemberPaymentService {

	public boolean paymentProcess(String gongu_id, String member_id, String delivery_id) {
		Connection con  = null;
		boolean orderresult = false;
		try {
			con = getConnection();
			OrderDAO orderDAO = OrderDAO.getInstance();                      
			orderDAO.setConnection(con);                                    
			                                                                
			orderresult= orderDAO.insertOrder(gongu_id, member_id, delivery_id);	
			
		}catch(Exception e) {
			System.out.println("MemberPaymentService에서 오류발생");
			e.printStackTrace();			
		}		
		return orderresult;
		
	}

	

}
