package qna.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.QnADAO;
import vo.QnA;

public class MemberQnAListService {

	public ArrayList<QnA> getMemberQnAList(String member_id) {
		ArrayList<QnA>memberQnAList = null;
		Connection con = null;
		try {
			con=getConnection();
			QnADAO qnaDAO = QnADAO.getInstance();
			qnaDAO.setConnection(con);
			memberQnAList = qnaDAO.memberQnAList(member_id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return memberQnAList;
	}

}
