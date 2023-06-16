package qna.svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.QaDAO;
import static db.JdbcUtil.*;

public class AdminChangeQnaAuthorService {

	public boolean changeAuthor(int qna_id) {
		boolean result = false;
		
		Connection con = null;
		
		try {
			con = getConnection();
			QaDAO qnaDAO = QaDAO.getInstance();
			qnaDAO.setConnection(con);
			
			int count = qnaDAO.updateQnaAuthor(qna_id);
			
			if(count>0) {
				result = true;
				commit(con);
				
			}else {
				rollback(con);
			}
			
		}catch(Exception e) {
			System.out.println("관리자답변넘기기실행오류:"+e);
			rollback(con);
			
		}finally {
			close(con);
		}
		
		return result;
	}

}
