package qna.svc;

import java.sql.Connection;

import dao.QnaDAO;

import static db.JdbcUtil.*;
import vo.Qna;

public class QnaDetailViewService {

	public Qna getQna(int qna_id) {
		Qna qna = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			QnaDAO qnaDAO = QnaDAO.getInstance();
			qnaDAO.setConnection(con);
			
			qna = qnaDAO.selectQna(qna_id);
			
		}catch(Exception e) {
			System.out.println("문의상세보기오류:"+e);
			
		}finally {
			close(con);
		}
		
		return qna;
	}

}
