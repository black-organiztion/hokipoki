package qna.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.QaDAO;
import vo.Qa;

public class MemberQuestionService {

	public boolean registQuestion(Qa qna) {
		boolean isResult = false;

		Connection con = null;

		try {
			con = getConnection();
			QaDAO qaDAO = QaDAO.getInstance();
			qaDAO.setConnection(con);

			int resultCnt = qaDAO.insertQuestion(qna);

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
