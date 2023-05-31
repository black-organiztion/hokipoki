package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import vo.Gongu;
import vo.MemberOrder;
import vo.MemberOrderGongu;

public class OrderDAO {
	private static OrderDAO orderDAO;
	Connection con;

	// private 기본생성자
	private OrderDAO() {
		super();
	}

	public static OrderDAO getInstance() {
		if (orderDAO == null) {
			orderDAO = new OrderDAO();
		}

		return orderDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public ArrayList<MemberOrderGongu> allMemberOrderList(String id) {
		ArrayList<MemberOrderGongu> allMemberOrderList = null;
		String sql ="select g.gongu_name, g.thumbnail_img, o.order_id, o.order_price, o.order_status, o.order_date from gongu  g join orders  o on o.gongu_id = g.gongu_id  where o.member_id =? order by order_date desc";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				allMemberOrderList = new ArrayList<MemberOrderGongu>();
				do{
					
					allMemberOrderList.add(new MemberOrderGongu(rs.getString("g.gongu_name"),rs.getString("g.thumbnail_img"),rs.getString("o.order_id"),rs.getString("o.order_price"),rs.getString("o.order_status"),rs.getString("o.order_date")));
					
				}while(rs.next());
			
			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}

			
		
		return allMemberOrderList;
			
	}
	
	
	
	public ArrayList<MemberOrderGongu> recentMemberOrderList(String id) {
		ArrayList<MemberOrderGongu> recentMemberOrderList = null;
		String sql ="select g.gongu_name, g.thumbnail_img, o.order_id, o.order_price, o.order_status, o.order_date from gongu  g join orders  o on o.gongu_id = g.gongu_id  where o.member_id =? order by order_date desc limit 3";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				recentMemberOrderList = new ArrayList<MemberOrderGongu>();
				do{
					
					recentMemberOrderList.add(new MemberOrderGongu(rs.getString("g.gongu_name"),rs.getString("g.thumbnail_img"),rs.getString("o.order_id"),rs.getString("o.order_price"),rs.getString("o.order_status"),rs.getString("o.order_date")));
					
				}while(rs.next());
			
			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}

			
		
		return recentMemberOrderList;
			
	}
	
	public Map<String, Object> selectOrder(String loginId, int loginAuthor, int order_id) {
		Map<String, Object> order = new HashMap<>();

		PreparedStatement psmt = null;
		
		ResultSet rs = null;
		String sql = "SELECT * FROM orders o JOIN gongu g ON o.gongu_id = g.gongu_id "
				+ "JOIN member m ON o.member_id = m.member_id " + "JOIN delivery d ON o.delivery_id = d.delivery_id " + "JOIN seller s ON g.seller_id = s.seller_id "
				+ "WHERE order_id = ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, order_id);
			rs = psmt.executeQuery();

			System.out.println(psmt);

			if (rs.next()) {
				order.put("order_id", rs.getInt("order_id"));
				order.put("order_status", rs.getString("order_status"));
				order.put("order_date", rs.getString("order_date"));
				order.put("gongu_name", rs.getString("gongu_name"));
				order.put("order_count", rs.getInt("order_count"));
				order.put("order_price", rs.getInt("order_price"));
				order.put("member_id", rs.getString("member_id"));
				order.put("member_name", rs.getString("member_name"));
				order.put("member_tel", rs.getString("member_tel"));
				order.put("member_email", rs.getString("member_email"));
				order.put("receiver_name", rs.getString("receiver_name"));
				order.put("receiver_tel", rs.getString("receiver_tel"));
				order.put("zipcode", rs.getString("zipcode"));
				order.put("addr1", rs.getString("addr1"));
				order.put("addr2", rs.getString("addr2"));
				order.put("seller_id", rs.getString("seller_id"));
				order.put("seller_name", rs.getString("seller_name"));
				order.put("seller_number", rs.getString("seller_number"));

			}

		} catch (Exception e) {
			System.out.println("주문상세선택오류:" + e);

		} finally {
			close(rs);
			close(psmt);
		}

		return order;
	}

	

	public boolean insertToOrder(String gongu_id, String member_id, int delivery_id) {
		boolean flag = false;
		ResultSet rs = null;
		int price = 0;
		PreparedStatement pstmt = null;		
		try {
			String sql="select gongu_discount_price from gongu where gongu_id = "+gongu_id;
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			price=rs.getInt(1);}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);			
		}
		
		int test = 0;
		
		String sql = "insert into orders (gongu_id, member_id, delivery_id, order_date, order_count, order_price, order_status) values(?,?,?,now(),default,?,'1')";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, gongu_id);
			pstmt.setString(2, member_id);
			pstmt.setInt(3, delivery_id);
			pstmt.setInt(4, price);
			test=pstmt.executeUpdate();
			if(test>0) {
				flag = true;
			}
			
			System.out.println(pstmt);			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return flag;
	}

	public ArrayList<MemberOrder> selectMemberOrderList(String member_id) {
		ArrayList<MemberOrder> memberOrderList = new ArrayList<>();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM orders WHERE member_id = ? AND order_status='5'";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, member_id);
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
					
					memberOrderList.add(order);
					
				}while(rs.next());
			}
			
		}catch(Exception e) {
			System.out.println("회원주문목록선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}

		
		return memberOrderList;
	}
	public int selectListCount(String id) {
		int listCount=0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt=con.prepareStatement("select count(*) from orders where member_id = "+id);
			rs = pstmt.executeQuery();
			if(rs.next()) listCount=rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	
	
	

	public int selectListCount(String loginId, int loginAuthor, String sOption, String sKeyword,
			ArrayList<String> filterList) {
		
		int listCount = 0;
		PreparedStatement psmt =  null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM orders o JOIN gongu g ON o.gongu_id = g.gongu_id JOIN member m ON o.member_id = m.member_id"; //시스템 - 검색조건 없음
		
		//조건1. 필터(필수로 들어감)
		if(filterList.size() >= 1 && !(filterList.get(0).equals("all"))) {//선택된 공구조건이 1개 이상이고 그 하나가 all(전체)이 아닐때만 실행  
			sql += " WHERE order_status IN(";
			for(int i=0; i<filterList.size(); i++) {
				sql += "'"+filterList.get(i)+"'";
				if(i<filterList.size()-1) {
					sql += ",";
				}
			}
			sql += ")";
			
		}else {//공구조건이 all일때만 실행 -> all이면 조건 안붙여도 되는데 하는 이유 : 조건절 시작을 위해 WHERE 붙여야되서
			sql += " WHERE order_status >= 0"; 
		}
		
		//조건2. 판매자 or 관리자 (판매자면 seller_id = loginId 조건)
		if(loginAuthor > 0) {
			sql += " AND g.seller_id='"+loginId+"'";
		}
		//조건3. 검색조건 유무
		if(sOption != null && sKeyword != null) {
			sql += " AND "+ sOption + " LIKE '%"+sKeyword+"%'";
					
		}
		
		try {
			psmt = con.prepareStatement(sql);
			System.out.println("주문개수선택쿼리"+psmt);
			rs = psmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1); //첫번째 컬럼값(count 함수 결과) 가져오기
			}
			
		}catch(Exception e) {
			System.out.println("주문개수선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		
		return listCount;
	}

	public List<Object> selectOrderList(int page, int limit, String loginId, int loginAuthor, String sOption,
			String sKeyword, ArrayList<String> filterList) {
		
		List<Object> orderList = new ArrayList<>();

		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM orders o JOIN gongu g ON o.gongu_id = g.gongu_id JOIN member m ON o.member_id = m.member_id";
		int startRow = (page-1)*limit; //시작행
		
		//조건1. 필터(필수로 들어감)
		if(filterList.size() >= 1 && !(filterList.get(0).equals("all"))) {//선택된 공구조건이 1개 이상이고 그 하나가 all(전체)이 아닐때만 실행  
			sql += " WHERE order_status IN(";
			for(int i=0; i<filterList.size(); i++) {
				sql += "'"+filterList.get(i)+"'";
				if(i<filterList.size()-1) {
					sql += ",";
				}
			}
			sql += ")";
			
		}else {//공구조건이 all일때만 실행 -> all이면 조건 안붙여도 되는데 하는 이유 : 조건절 시작을 위해 WHERE 붙여야되서
			sql += " WHERE order_status >= 0"; 
		}
		
		//조건2. 판매자 or 관리자 (판매자면 seller_id = loginId 조건)
		if(loginAuthor > 0) {
			sql += " AND g.seller_id='"+loginId+"'";
		}
		//조건3. 검색조건 유무
		if(sOption != null && sKeyword != null) {
			sql += " AND "+ sOption + " LIKE '%"+sKeyword+"%'";
					
		}
		
		sql+=" ORDER BY order_date DESC limit ?, ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, startRow);
			psmt.setInt(2, limit);
			System.out.println(psmt);
			rs = psmt.executeQuery();

			if (rs.next()) {
				do {
					Map<String, Object> order = new HashMap<>();
					order.put("order_id", rs.getInt("order_id")); // 주문번호
					order.put("order_status", rs.getString("order_status")); // 주문상태
					order.put("member_id", rs.getString("member_id")); // 주문자id
					order.put("member_name", rs.getString("member_name"));// 주문자이름
					order.put("member_tel", rs.getString("member_tel"));// 주문자연락처
					order.put("gongu_id", rs.getString("gongu_id")); // 공구id
					order.put("gongu_name", rs.getString("gongu_name")); // 공구이름
					order.put("order_count", rs.getInt("order_count")); // 주문수량
					order.put("order_price", rs.getInt("order_price")); // 구매금액
					order.put("order_date", rs.getString("order_date")); // 주문일시
					order.put("order_end_date", rs.getString("order_end_date")); // 구매확정일자
					// 결제일시
					// 결제방법
					// 받는사람
					// 받는사람연락처
					// 주소

					orderList.add(order);

				} while (rs.next());
			}

		} catch (Exception e) {
			System.out.println("주문목록선택오류:" + e);

		} finally {
			close(rs);
			close(psmt);
		}

		return orderList;
	}	
	

	
	public List<Object> selectOrderList(String loginId, int loginAuthor) {
		List<Object> orderList = new ArrayList<>();

		PreparedStatement psmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM orders o JOIN gongu g ON o.gongu_id = g.gongu_id JOIN member m ON o.member_id = m.member_id";

		if (loginAuthor != 0) {
			sql += " WHERE ";

			switch (loginAuthor) {
			case 1:
				sql += "o.gongu_id IN (SELECT gongu_id FROM gongu WHERE seller_id = '" + loginId + "')";
				break;
			default:
				sql += "o.member_id = '" + loginId + "'";
				break;
			}
		}

		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();

			if (rs.next()) {
				do {
					Map<String, Object> order = new HashMap<>();
					order.put("order_id", rs.getInt("order_id")); // 주문번호
					order.put("order_status", rs.getString("order_status")); // 주문상태
					order.put("member_id", rs.getString("member_id")); // 주문자id
					order.put("member_name", rs.getString("member_name"));// 주문자이름
					order.put("member_tel", rs.getString("member_tel"));// 주문자연락처
					order.put("gongu_id", rs.getString("gongu_id")); // 공구id
					order.put("gongu_name", rs.getString("gongu_name")); // 공구이름
					order.put("order_count", rs.getInt("order_count")); // 주문수량
					order.put("order_price", rs.getInt("order_price")); // 구매금액
					order.put("order_date", rs.getString("order_date")); // 주문일시
					order.put("order_end_date", rs.getString("order_end_date")); // 구매확정일자
					// 결제일시
					// 결제방법
					// 받는사람
					// 받는사람연락처
					// 주소

					orderList.add(order);

				} while (rs.next());
			}

		} catch (Exception e) {
			System.out.println("주문목록선택오류:" + e);

		} finally {
			close(rs);
			close(psmt);
		}

		return orderList;
	}

	public List<Object> selectOrderList(String loginId, int loginAuthor, ArrayList<String> filterList) {
		List<Object> orderList = new ArrayList<>();

		PreparedStatement psmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM orders o JOIN gongu g ON o.gongu_id = g.gongu_id JOIN member m ON o.member_id = m.member_id";

		if (loginAuthor != 0) {
			sql += " WHERE ";

			switch (loginAuthor) {
			case 1:
				sql += "o.gongu_id IN (SELECT gongu_id FROM gongu WHERE seller_id = '" + loginId + "')";
				break;
			default:
				sql += "o.member_id = '" + loginId + "'";
				break;
			}
		}
		
		if(filterList.size() >= 1 && !(filterList.get(0).equals("all"))) {
			sql += " AND o.order_status IN(";
			for(int i=0; i<filterList.size(); i++) {
				sql += "'"+filterList.get(i)+"'";
				if(i<filterList.size()-1) {
					sql += ",";
				}
			}
			sql += ")";
		}
		

		try {
			System.out.println(sql);
			System.out.println(loginAuthor);

			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();

			if (rs.next()) {
				do {
					Map<String, Object> order = new HashMap<>();
					order.put("order_id", rs.getInt("order_id")); // 주문번호
					order.put("order_status", rs.getString("order_status")); // 주문상태
					order.put("member_id", rs.getString("member_id")); // 주문자id
					order.put("member_name", rs.getString("member_name"));// 주문자이름
					order.put("member_tel", rs.getString("member_tel"));// 주문자연락처
					order.put("gongu_id", rs.getString("gongu_id")); // 공구id
					order.put("gongu_name", rs.getString("gongu_name")); // 공구이름
					order.put("order_count", rs.getInt("order_count")); // 주문수량
					order.put("order_price", rs.getInt("order_price")); // 구매금액
					order.put("order_date", rs.getString("order_date")); // 주문일시
					order.put("order_end_date", rs.getString("order_end_date")); // 구매확정일자
					// 결제일시
					// 결제방법
					// 받는사람
					// 받는사람연락처
					// 주소

					orderList.add(order);

				} while (rs.next());
			}

		} catch (Exception e) {
			System.out.println("주문목록선택오류:" + e);

		} finally {
			close(rs);
			close(psmt);
		}

		return orderList;
	}
	
	
	public int[] updateOrder(ArrayList<Gongu> closeList) {
		int[] runTotal = new int[2];
		int result = 0; //updateCnt
		int runCnt = 0; //종료공구에 대한 주문건수가 없을 수도 있음 -> update된 결과가 없어서 오류가 아니더라도 rollback됨
		int totalCnt = 0;
		PreparedStatement psmt = null;
		try {

			for (int i = 0; i < closeList.size(); i++) {

				String sql = "";

				if (closeList.get(i).getGongu_status().equals("8")) {
					sql = "UPDATE orders SET order_status = '2' WHERE gongu_id = '" + closeList.get(i).getGongu_id()
							+ "'";
				} else {
					sql = "UPDATE orders SET order_status = '0' WHERE gongu_id = '" + closeList.get(i).getGongu_id()
							+ "'";
				}

				psmt = con.prepareStatement(sql);
				System.out.println(psmt);
				result = psmt.executeUpdate();
				
				runCnt++;
				
				if(result > 0) {
					totalCnt++;
				}
				
				
				//System.out.println("쿼리별order update건수" + totalCnt);

			}
			
			runTotal[0] = runCnt;
			runTotal[1] = totalCnt;
			
			
		} catch (Exception e) {
			System.out.println("주문업데이트오류:" + e);

		} finally {
			close(psmt);
		}

		return runTotal;
	}




	

}
