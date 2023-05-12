package delivery.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

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

	public ArrayList<Delivery> getDeliveryList(String member_id) {
		ArrayList<Delivery> deliveryList = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			DeliveryDAO deliveryDAO = DeliveryDAO.getInstance();
			deliveryDAO.setConnection(con);
			deliveryList = deliveryDAO.selectDeliveryList(member_id);
			
		}catch(Exception e) {
			//e.printStackTrace();
			System.out.println("회원배송지목록조회오류"+e);
		}
		finally {
			close(con);
		}
		
		return deliveryList;
	}

}
