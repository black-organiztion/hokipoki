package delivery.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.DeliveryDAO;
import vo.Delivery;

public class DeliveryInsertService {

	public boolean insertDelivery(Delivery delivery) {
		boolean success = false;
		Connection con = null;
		int insertCount;		
			try {
				con=getConnection();
				DeliveryDAO deliveryDAO=DeliveryDAO.getInstance();
				deliveryDAO.setConnection(con);
				insertCount = deliveryDAO.insertdelivery(delivery);
				if(insertCount>0) {
					success = true;
					commit(con);
					}
				}catch(Exception e) {
				System.out.println("deliveryJoinService에서 오류발생");
				e.printStackTrace();
				rollback(con);
			}finally {
				close(con);
			}
			return success;
		}

}
