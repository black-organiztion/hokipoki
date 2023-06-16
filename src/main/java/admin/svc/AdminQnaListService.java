package admin.svc;

import java.util.ArrayList;

import dao.QaDAO;
import vo.Qa;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;



public class AdminQnaListService {
	public int getListCount(String loginId, int loginAuthor, String sOption, String sKeyword,
			ArrayList<String> filterList) {

		int listCount = 0;

		Connection con = null;

		try {
			con = getConnection();
			QaDAO qnaDAO = QaDAO.getInstance();
			qnaDAO.setConnection(con);

			listCount = qnaDAO.selectListCount(loginId,loginAuthor,sOption,sKeyword,filterList);

		}catch(Exception e) {
			System.out.println("관리자문의갯수조회오류:"+e);

		}finally {
			close(con);
		}


		return listCount;
	}
	
	//문의목록
	public ArrayList<Qa> getQnaList(int page, int limit, String loginId, int loginAuthor, String sOption,
			String sKeyword, ArrayList<String> filterList) {

		ArrayList<Qa> qnaList = null;

		Connection con = null;

		try {
			con = getConnection();
			QaDAO qnaDAO = QaDAO.getInstance();
			qnaDAO.setConnection(con);

			qnaList = qnaDAO.selectQnaList(page, limit, loginId, loginAuthor, sOption, sKeyword, filterList);

		}catch(Exception e) {
			System.out.println("관리자문의목록조회오류:"+e);

		}finally {
			close(con);
		}


		return qnaList;
	}
	
	//미응답건수
	public int getNoAnswerCnt(String loginId, int loginAuthor) {
		int count = 0;
		
		Connection con = null;
		
		try {
			con = getConnection();
			QaDAO qnaDAO = QaDAO.getInstance();
			qnaDAO.setConnection(con);
			
			count = qnaDAO.selectNoAnswerCnt(loginId, loginAuthor);
			
		}catch(Exception e) {
			System.out.println("관리자문의미응답건수조회오류:"+e);
			
		}finally {
			close(con);
		}
		
		return count;
	}
	
	
}
