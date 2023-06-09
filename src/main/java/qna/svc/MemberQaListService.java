package qna.svc;

import java.sql.Connection;
import java.util.ArrayList;

import static db.JdbcUtil.*;
import dao.QaDAO;
import vo.Qa;

public class MemberQaListService {

	public int getListCount(String loginId, int loginAuthor) {
		int listCount = 0;

		Connection con =  null;

		try {
			con = getConnection();
			QaDAO qnaDAO = QaDAO.getInstance();
			qnaDAO.setConnection(con);

			listCount = qnaDAO.selectListCount(loginId);

		}catch(Exception e) {
			System.out.println("회원문의글갯수조회오류:"+e);
		}finally {
			close(con);
		}

		return listCount;
	}

	public ArrayList<Qa> getQnaList(int page, int limit, String loginId, int loginAuthor) {
		ArrayList<Qa> qnaList = null;

		Connection con =  null;

		try {
			con = getConnection();
			QaDAO qnaDAO = QaDAO.getInstance();
			qnaDAO.setConnection(con);

			qnaList = qnaDAO.selectQnaList(page,limit,loginId);

		}catch(Exception e) {
			System.out.println("회원문의글목록조회오류:"+e);
		}finally {
			close(con);
		}

		return qnaList;
	}

}
