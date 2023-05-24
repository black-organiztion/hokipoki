package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import static db.JdbcUtil.*;
import vo.Seller;
import vo.Member;

public class AdminDAO {
	private static AdminDAO adminDAO;
	Connection con;
	
	//private 기본생성자
	private AdminDAO() {super();};
	
	public static AdminDAO getInstance() {
		if(adminDAO == null) {
			adminDAO = new AdminDAO();
		}
		
		return adminDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertSeller(Seller seller) {
		int insertCount = 0;
		
		PreparedStatement psmt = null;
		String sql = "INSERT INTO seller VALUES(?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, seller.getSeller_id());
			psmt.setString(2, seller.getSeller_pw());
			psmt.setString(3, seller.getSeller_name());
			psmt.setString(4, seller.getSeller_number());
			psmt.setInt(5, seller.getSeller_author());
			
			insertCount = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("판매자 추가 실패 : "+e);
			
		}finally {
			close(psmt);
		}
		
		return insertCount;
	}


	public Seller selectSeller(String seller_id, String seller_pw) {
		Seller seller = null;
		
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM seller WHERE seller_id = ? AND seller_pw = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, seller_id);
			psmt.setString(2, seller_pw);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				seller = new Seller(rs.getString("seller_id"),
									rs.getString("seller_pw"),
									rs.getString("seller_name"),
									rs.getString("seller_number"),
									rs.getInt("seller_author"));
			}
			
			System.out.println(seller.getSeller_id());
			
		}catch(Exception e) {
			System.out.println("계정 찾기 실패 : "+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		return seller;
	}

	public int setSellerAuthor(String seller_id) {
		int result = 0;
		PreparedStatement psmt = null;
		String sql = "UPDATE seller SET seller_author = 1 WHERE seller_id = ?";
		System.out.println(psmt);
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, seller_id);
			
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("판매자권한수정 오류:"+e);
			
		}finally{
			close(psmt);
		}
		
		
		return result;
	}

	

	public int checkDupl(String seller_id) {
		int result = 0;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM seller WHERE seller_id = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, seller_id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
				
			}else {
				result = 0;
			}
			
		}catch(Exception e) {
			System.out.println("판매자아이디중복조회오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		return result;
	}

	public Seller selectSellerInfo(String seller_id) {
		Seller seller = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM seller WHERE seller_id = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, seller_id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				seller = new Seller();
				seller.setSeller_id(rs.getString("seller_id"));
				seller.setSeller_pw(rs.getString("seller_pw"));
				seller.setSeller_name(rs.getString("seller_name"));
				seller.setSeller_number(rs.getString("seller_number"));
			}
			
			
		}catch(Exception e) {
			System.out.println("판매자정보선택오류"+e);
			
		}finally{
			close(rs);
			close(psmt);
		}
		
		return seller;
	}

	public int checkIdentify(String seller_id, String seller_pw) {
		int result = 0;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM seller WHERE seller_id = ? AND seller_pw = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, seller_id);
			psmt.setString(2, seller_pw);
			System.out.println(psmt);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
				
			}else {
				result = 0;
			}
			
		}catch(Exception e) {
			System.out.println("판매자비밀번호조회오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		return result;
	}

	public int updateSeller(Seller seller) {
		int result = 0;
		PreparedStatement psmt = null;
		String sql = "UPDATE seller SET seller_pw = ? WHERE seller_id='"+seller.getSeller_id()+"'"; //지금은 판매자가 수정가능한 정보가 비밀번호뿐
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, seller.getSeller_pw());
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("판매자정보업데이트오류:"+e);
			
		}finally {
			close(psmt);
		}
		
		return result;
	}

	public int selectMemberListCount(String loginId, int loginAuthor, String sOption, String sKeyword) {
		int listCount = 0;
		PreparedStatement psmt =  null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM member";
		
		if(sOption != null && sKeyword != null) {
			sql += " WHERE "+ sOption + " LIKE '%"+sKeyword+"%'";
					
		}
		
		try {
			psmt = con.prepareStatement(sql);
			System.out.println("회원개수선택쿼리"+psmt);
			rs = psmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1); //첫번째 컬럼값(count 함수 결과) 가져오기
			}
			
		}catch(Exception e) {
			System.out.println("회원개수선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		return listCount;
	}

	public ArrayList<Member> selectMemberList(int page, int limit, String loginId, int loginAuthor, String sOption,
			String sKeyword) {

		ArrayList<Member> memberList = new ArrayList<>();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM member";
		int startRow = (page-1)*limit; //시작행
		
		//조건. 검색조건 유무
		if(sOption != null && sKeyword != null) {
			sql += " WHERE "+ sOption + " LIKE '%"+sKeyword+"%'";
					
		}
		
		sql+=" ORDER BY member_date DESC limit ?, ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, startRow);
			psmt.setInt(2, limit);
			System.out.println(psmt);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				do {
					Member member = new Member(rs.getString("member_id"),
												rs.getString("membership_id"),
												rs.getString("member_pw"),
												rs.getString("member_name"),
												rs.getString("member_tel"),
												rs.getString("member_email"),
												rs.getString("recommend_id"),
												rs.getDate("member_date")
												);
					memberList.add(member);
					
				}while(rs.next());
			}
			
		}catch(Exception e) {
			System.out.println("회원목록선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		return memberList;
	}

	public int selectSellerListCount(String loginId, int loginAuthor, String sOption, String sKeyword) {
		int listCount = 0;
		PreparedStatement psmt =  null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM seller";
		
		if(sOption != null && sKeyword != null) {
			sql += " WHERE "+ sOption + " LIKE '%"+sKeyword+"%'";
					
		}
		
		try {
			psmt = con.prepareStatement(sql);
			System.out.println("판매자개수선택쿼리"+psmt);
			rs = psmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1); //첫번째 컬럼값(count 함수 결과) 가져오기
			}
			
		}catch(Exception e) {
			System.out.println("판매자개수선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		return listCount;
	}

	public ArrayList<Seller> selectSellerList(int page, int limit, String loginId, int loginAuthor, String sOption,
			String sKeyword) {

		ArrayList<Seller> sellerList = new ArrayList<Seller>();
		
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM seller WHERE seller_author !=0 ";
		
		int startRow = (page-1)*limit; //시작행
		
		//조건. 검색조건 유무
		if(sOption != null && sKeyword != null) {
			sql += " AND "+ sOption + " LIKE '%"+sKeyword+"%'";
					
		}
		
		sql+=" ORDER BY seller_author DESC limit ?, ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, startRow);
			psmt.setInt(2, limit);
			System.out.println(psmt);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				do {
					Seller seller = new Seller(rs.getString("seller_id"),
												rs.getString("seller_pw"),
												rs.getString("seller_name"),
												rs.getString("seller_number"),
												rs.getInt("seller_author"));
					sellerList.add(seller);
					
				}while(rs.next());
			}
			
		}catch(Exception e) {
			System.out.println("판매자목록선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		
		return sellerList;
	}

	public int selectStandByCnt(String loginId, int loginAuthor) {
		int count = 0;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM seller WHERE seller_author NOT IN (0,1)";
		
		try {
			psmt = con.prepareStatement(sql);
			System.out.println(psmt);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch(Exception e) {
			System.out.println("승인대기공구선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		return count;
	}
	

}
