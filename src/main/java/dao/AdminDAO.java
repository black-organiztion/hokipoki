package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import static db.JdbcUtil.*;
import vo.Seller;

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
			psmt.setString(3, seller.getSeller_number());
			psmt.setString(4, seller.getSeller_name());
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

	public ArrayList<Seller> selectSellerList() {
		ArrayList<Seller> sellerList = new ArrayList<Seller>();
		
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM seller WHERE seller_author !=0 ORDER BY seller_author DESC";
		
		try {
			psmt = con.prepareStatement(sql);
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
			System.out.println("판매자리스트조회 오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		
		return sellerList;
	}

	
}
