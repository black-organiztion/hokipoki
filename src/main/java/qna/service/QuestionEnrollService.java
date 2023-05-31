package qna.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.QnADAO;
import vo.QnA;

public class QuestionEnrollService {

	public int qnaInsert(QnA qna) {
		Connection con = null;
		int Chknum = 0;
		try {
			con =getConnection();
			QnADAO qnaDAO = QnADAO.getInstance();
			qnaDAO.setConnection(con);
			Chknum = qnaDAO.insertQnA(qna);
			if(Chknum>0) {
				commit(con);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return Chknum;
	}

}
