package delivery.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.DeliveryDAO;
import vo.Delivery;

public class DeliveryGetService {

	public Delivery getDelivery(String id) {
		Connection con = null;
		Delivery delivery =null;
		
		try {
			con = getConnection();
			DeliveryDAO deliveryDAO = DeliveryDAO.getInstance();
			deliveryDAO.setConnection(con);
			delivery = deliveryDAO.returndelivery(id,"1");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(con);
		}
		return delivery;
		
	}

}
