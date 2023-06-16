package qna.svc;

import java.sql.Connection;
import java.util.HashMap;

import dao.QaDAO;

import static db.JdbcUtil.*;

public class AdminQnaDetailViewService {

	public HashMap<String, Object> getQna(int qna_id, int qna_category) {
		HashMap<String, Object> qna = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			QaDAO qnaDAO = QaDAO.getInstance();
			qnaDAO.setConnection(con);
			
			qna = qnaDAO.selectAdminQna(qna_id, qna_category);
			
		}catch(Exception e) {
			System.out.println("관리자문의상세조회오류:"+e);
			
		}finally {
			close(con);
		}
		
		return qna;
	}

}
