package qna.svc;

import java.sql.Connection;

import dao.QaDAO;

import static db.JdbcUtil.*;

public class AdminAnswerService {

	public boolean addAnswer(int qna_id, String answer, String seller_id) {
		boolean result = false;
		
		Connection con = null;
		
		try {
			con = getConnection();
			QaDAO qnaDAO = QaDAO.getInstance();
			qnaDAO.setConnection(con);
			
			int resultCount = qnaDAO.insertAnswer(qna_id,answer,seller_id);
			
			if(resultCount > 0) {
				result = true;
				commit(con);
				
			}else {
				rollback(con);
			}
			
			
		}catch(Exception e) {
			System.out.println("관리자답변등록오류:"+e);
			rollback(con);
			
		}finally {
			close(con);
		}
		
		return result;
	}

}
