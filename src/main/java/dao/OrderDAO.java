package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.MemberOrder;
import static db.JdbcUtil.*;

public class OrderDAO {
	private static OrderDAO orderDAO;
	Connection con;
	
	//private 기본생성자
	private OrderDAO() {super();}
	
	public static OrderDAO getInstance() {
		if(orderDAO == null) {
			orderDAO = new OrderDAO();
		}
		
		return orderDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	public ArrayList<MemberOrder> selectOrderList(String loginId, int loginAuthor) {
		ArrayList<MemberOrder> orderList = new ArrayList<MemberOrder>();
		
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM orders";
		if(loginAuthor != 0) {
			sql += " WHERE gongu_id = (SELECT gongu_id FROM gongu WHERE seller_id = '"+loginId+"')";
		}
		
		try {
			//System.out.println(sql);
			
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				do {
					MemberOrder order = new MemberOrder();
					order.setOrder_id(rs.getInt("order_id"));
					order.setGongu_id(rs.getInt("gongu_id"));
					order.setMember_id(rs.getString("member_id"));
					order.setDelivery_id(rs.getInt("delivery_id"));
					order.setOrder_date(rs.getString("order_date"));
					order.setOrder_count(rs.getInt("order_count"));
					order.setOrder_end_date(rs.getString("order_end_date"));
					order.setOrder_price(rs.getInt("order_price"));
					order.setOrder_status(rs.getString("order_status"));
					
					orderList.add(order);
					
				}while(rs.next());
			}	
			
		}catch(Exception e) {
			System.out.println("주문목록선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		
		return orderList;
	}
}
