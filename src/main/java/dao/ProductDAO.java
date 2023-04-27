package dao;
import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;

import vo.Product;

public class ProductDAO {

	private static ProductDAO productDAO;
	private Connection con;

	private ProductDAO() {
	};// 다른 곳에서 생성자를 생성하는 걸 막기 위함 (싱글톤 방식이므로 dogdao객체는 getinstance방식으로만 생성해야 한다.)

	public static ProductDAO getInstance() {
		if (productDAO == null) {
			productDAO = new ProductDAO();
		}
		return productDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public int insertProduct(Product product) {
		int insertCount = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into product values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);

			/*
			 * product.setProduct_id(i);
			 * product.setCategory(multi.getParameter("category"));
			 * product.setProduct_name(multi.getParameter("productname"));
			 * product.setProduct_price(multi.getParameter("originprice"));
			 * product.setProduct_date(now_dt); product.setProdcut_view_count(0);
			 * product.setProduct_discount_price(multi.getParameter("shareprice"));
			 * product.setProduct_startdate(now_dt); product.setProduct_findate(now_dt);
			 * product.setProduct_stock(multi.getParameter("productstock"));
			 * product.setProduct_reserve("1");
			 * product.setProduct_min(multi.getParameter("minproduct"));
			 * product.setProduct_caldate(multi.getParameter("caldate"));
			 */	
			
			pstmt.setInt(1, product.getProduct_id());
			pstmt.setString(2,"dkan");
			pstmt.setString(3,"dummy");
			pstmt.setString(4,product.getProduct_name());
			pstmt.setString(5,product.getProduct_price());
			pstmt.setString(6,product.getProduct_discount_price());
			pstmt.setString(7,product.getProduct_date());
			pstmt.setInt(8,0);
			pstmt.setString(9,"1");
			pstmt.setString(10,product.getProduct_startdate());
			pstmt.setString(11,product.getProduct_findate());
			pstmt.setString(12,product.getProduct_stock());
			pstmt.setString(13,product.getProduct_reserve());
			pstmt.setString(14,product.getProduct_min());
//			pstmt.setString(15,"now()");


			
			
			
			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return insertCount;

	}
	
}
