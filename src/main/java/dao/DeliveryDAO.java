package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import vo.Delivery;


public class DeliveryDAO {

	private static DeliveryDAO deliveryDAO;
	private Connection con;

	private DeliveryDAO() {
	};// 다른 곳에서 생성자를 생성하는 걸 막기 위함 (싱글톤 방식이므로 dogdao객체는 getinstance방식으로만 생성해야 한다.)

	public static DeliveryDAO getInstance() {
		if (deliveryDAO == null) {
			deliveryDAO = new DeliveryDAO();
		}
		return deliveryDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	

	public int insertdelivery(Delivery delivery) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into delivery (member_id, isdefault, delivery_name, receiver_name, receiver_tel, receiver_tel2, zipcode, addr1,addr2)values (?,?,?,?,?,?,?,?,?)";
		int insertCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delivery.getMember_id());
			pstmt.setString(2, delivery.getIsdefault());
			pstmt.setString(3, delivery.getDelivery_name());
			pstmt.setString(4, delivery.getReceiver_name());
			pstmt.setString(5, delivery.getReceiver_tel());
			pstmt.setString(6, delivery.getReceiver_tel2());
			pstmt.setString(7, delivery.getZip_code());
			pstmt.setString(8, delivery.getAddr1());
			pstmt.setString(9, delivery.getAddr2());		
			
			
			System.out.println("insertdelivery pstmt:" + pstmt);

			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return insertCount;
		
		
	}

	public Delivery returndelivery(String member_id, String isdefault) {
		Delivery delivery = null;
		ResultSet rs = null;
		String sql = "";
		
		
		PreparedStatement pstmt = null;
		if(isdefault.equals("1")) {
			sql = "select * from delivery where member_id = ? and isdefault = '1'";			
		}else{
			sql = "select * from delivery where delivery_id = select(max(delivery_id) from delivery where member_id = ? and isdefault = '0')";			
			
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();				

			if (rs.next()) {
				delivery= new Delivery();
				delivery.setMember_id(member_id);
				delivery.setDelivery_id(rs.getString(1));
				delivery.setIsdefault(rs.getString(3));
				delivery.setDelivery_name(rs.getString(4));
				delivery.setReceiver_name(rs.getString(5));
				delivery.setReceiver_tel(rs.getString(6));
				delivery.setReceiver_tel2(rs.getString(7));
				delivery.setZip_code(rs.getString(8));
				delivery.setAddr1(rs.getString(9));
				delivery.setAddr2(rs.getString(10));
				System.out.println(delivery);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return delivery;
	}
	
	
	
}
