package delivery.svc;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.DeliveryDAO;
import vo.Delivery;

public class ReturndeliveryIdService {

	public int  returnDeliveryId(Delivery delivery) {
		int deliveryId = 0;
		DeliveryDAO deliveryDAO = DeliveryDAO.getInstance();
		Connection con = null;
		
		try {
			con= getConnection();
			deliveryDAO.setConnection(con);
			
			deliveryId = deliveryDAO.insertdelivery(delivery);
			if(deliveryId>0) {
				commit(con);
			}
		}catch(Exception e){
			System.out.println("ReturnDeliveryIdService에서 오류 발생");
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		
		
		
		return deliveryId;
	}

}
