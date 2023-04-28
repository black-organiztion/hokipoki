package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public List<Object> selectOrderList(String loginId, int loginAuthor) {
		List<Object> orderList = new ArrayList<>();

		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM orders o JOIN gongu g ON o.gongu_id = g.gongu_id JOIN member m ON o.member_id = m.member_id";
		
		if(loginAuthor != 0) {
			sql+= " WHERE ";
			
			switch(loginAuthor) {
			case 1: sql+="o.gongu_id = (SELECT gongu_id FROM gongu WHERE seller_id = '"+loginId+"')"; break;
			default: sql+="o.member_id = '"+loginId+"'"; break;
			}	
		}
		

		try {
			System.out.println(sql);
			System.out.println(loginAuthor);
			
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				do {
					Map<String, Object> order = new HashMap<>();
					order.put("order_id", rs.getInt("order_id")); //주문번호
					order.put("order_status", rs.getString("order_status")); //주문상태
					order.put("member_id",rs.getString("member_id")); //주문자id
					order.put("member_name",rs.getString("member_name"));//주문자이름
					order.put("member_tel",rs.getString("member_tel"));//주문자연락처
					order.put("gongu_id", rs.getString("gongu_id")); //공구id
					order.put("gongu_name", rs.getString("gongu_name")); //공구이름
					order.put("order_count", rs.getInt("order_count")); //주문수량
					order.put("order_price", rs.getInt("order_price")); //구매금액
					order.put("order_date", rs.getString("order_date")); //주문일시
					order.put("order_end_date", rs.getString("order_end_date")); //구매확정일자
					//결제일시
					//결제방법
					//받는사람
					//받는사람연락처
					//주소
					
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

	public Map<String, Object> selectOrder(String loginId, int loginAuthor, int order_id) {
		Map<String,Object> order = new HashMap<>();
		
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM orders o JOIN gongu g ON o.gongu_id = g.gongu_id "
				+ "JOIN member m ON o.member_id = m.member_id "
				+ "JOIN delivery d ON o.delivery_id = d.delivery_id "
				+ "WHERE order_id = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, order_id);
			rs = psmt.executeQuery();
			
			System.out.println(sql);
			
			if(rs.next()) {
				order.put("order_id", rs.getInt("order_id"));
				order.put("order_status", rs.getString("order_status"));
				order.put("order_date", rs.getString("order_date"));
				order.put("gongu_name", rs.getString("gongu_name"));
				order.put("order_count", rs.getInt("order_count"));
				order.put("order_price", rs.getInt("order_price"));
				order.put("member_name", rs.getString("member_name"));
				order.put("member_tel", rs.getString("member_tel"));
				order.put("member_email", rs.getString("member_email"));
				order.put("receiver_name", rs.getString("receiver_name"));
				order.put("receiver_tel", rs.getString("receiver_tel"));
				order.put("zipcode", rs.getString("zipcode"));
				order.put("addr1", rs.getString("addr1"));
				order.put("addr2", rs.getString("addr2"));
				
			}
			

		}catch(Exception e) {
			System.out.println("주문상세선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		
		
		return order;
	}
}
