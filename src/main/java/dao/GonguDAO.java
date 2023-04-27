package dao;
import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;

import vo.Gongu;
import vo.Gongu_imgfile;

public class GonguDAO {

	private static GonguDAO gonguDAO;
	private Connection con;

	private GonguDAO() {
	};// 다른 곳에서 생성자를 생성하는 걸 막기 위함 (싱글톤 방식이므로 dogdao객체는 getinstance방식으로만 생성해야 한다.)

	public static GonguDAO getInstance() {
		if (gonguDAO == null) {
			gonguDAO = new GonguDAO();
		}
		return gonguDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertGongu(Gongu gongu) {
		int insertCount = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		try {
			
			String sql = "insert into gongu (category_name, seller_id, gongu_name, gongu_price,"
					+ "gongu_discount_price, gongu_date,gongu_view_count,gongu_status,gongu_startdate,"
					+ "gongu_findate, gongu_stock, gongu_reserve, gongu_min, gongu_caldate,detail_img,thumbnail_img"
					+ ") values(?,?,?,?,?,now(),?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);			
			
	
			pstmt.setString(1,gongu.getCategory()); 
			pstmt.setString(2,"dummy seller id");
			pstmt.setString(3,gongu.getGongu_name());
			pstmt.setString(4,gongu.getGongu_price());
			pstmt.setString(5,gongu.getGongu_discount_price());
			
			pstmt.setInt(6,0);
			pstmt.setString(7,"0");
			pstmt.setString(8,gongu.getGongu_startdate());
			pstmt.setString(9,gongu.getGongu_findate());
			pstmt.setString(10,gongu.getGongu_stock());
			pstmt.setString(11,gongu.getGongu_reserve());
			pstmt.setString(12,gongu.getGongu_min());
			pstmt.setString(13,gongu.getGongu_caldate());
			pstmt.setString(14,gongu.getDetail_img());
			pstmt.setString(15,gongu.getThumbail_img());
			
			System.out.println("pstmt:"+pstmt);
			
			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return insertCount;

	}
	
}
