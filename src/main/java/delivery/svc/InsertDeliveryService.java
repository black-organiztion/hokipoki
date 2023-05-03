package delivery.svc;


import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.DeliveryDAO;
import vo.Delivery;


public class InsertDeliveryService {

	public boolean insertDelivery(Delivery delivery) {
		
		Connection con = null;
		DeliveryDAO deliveryDAO = null;
		int i = 0;
		boolean flag = false;
		try {
			
			con = getConnection();
			deliveryDAO = DeliveryDAO.getInstance();
			deliveryDAO.setConnection(con);
			i = deliveryDAO.insertdelivery(delivery);
			if(i>0) {flag=true;			
			commit(con);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {			
			close(con);
		}
		
		return flag;
	}

}
