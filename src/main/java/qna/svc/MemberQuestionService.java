package qna.svc;

import java.sql.Connection;

import dao.QnaDAO;

import static db.JdbcUtil.*;
import vo.Qna;

public class MemberQuestionService {

	public boolean registQuestion(Qna qna) {
		boolean isResult = false;
		
		Connection con = null;
		
		try {
			con = getConnection();
			QnaDAO qnaDAO = QnaDAO.getInstance();
			qnaDAO.setConnection(con);
			
			int resultCnt = qnaDAO.insertQuestion(qna);
			
			if(resultCnt > 0) {
				isResult = true;
				commit(con);
				
			}else {
				rollback(con);
			}
			
			
		}catch(Exception e) {
			System.out.println("회원문의등록오류:"+e);
			rollback(con);
			
		}finally {
			close(con);
		}
		
		return isResult;
	}

}
