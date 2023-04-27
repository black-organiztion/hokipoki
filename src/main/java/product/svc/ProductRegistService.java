package product.svc;


import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.ProductDAO;
import vo.Product;

public class ProductRegistService {

	public boolean isRegistSuccess(Product product) {
		boolean isregistSuccess= false;
		Connection con = null;
		try {
			con=getConnection();
			ProductDAO productDAO = ProductDAO.getInstance();
			productDAO.setConnection(con);
			
			int insertCount = productDAO.insertProduct(product);
			if(insertCount>0) {
				commit(con);
				isregistSuccess = true;				
			}else {
				rollback(con);
			}						
			
		}catch(Exception e) {
			e.printStackTrace();
			rollback(con);
		}finally {
			close(con);
		}
		
		
		
		
		
		return isregistSuccess;
	}

}
