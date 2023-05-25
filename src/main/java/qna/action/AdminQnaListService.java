package qna.action;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.QnaDAO;
import vo.Qna;

public class AdminQnaListService {

	public int getListCount(String loginId, int loginAuthor, String sOption, String sKeyword,
			ArrayList<String> filterList) {
		
		int listCount = 0;
		
		Connection con = null;
		
		try {
			con = getConnection();
			QnaDAO qnaDAO = QnaDAO.getInstance();
			qnaDAO.setConnection(con);
			
			listCount = qnaDAO.selectListCount(loginId,loginAuthor,sOption,sKeyword,filterList);
			
		}catch(Exception e) {
			System.out.println("관리자문의갯수조회오류:"+e);
			
		}finally {
			close(con);
		}
		
		
		return listCount;
	}

	public int getNoAnswerCnt(String loginId, int loginAuthor) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Qna> getQnaList(int page, int limit, String loginId, int loginAuthor, String sOption,
			String sKeyword, ArrayList<String> filterList) {
		
		ArrayList<Qna> qnaList = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			QnaDAO qnaDAO = QnaDAO.getInstance();
			qnaDAO.setConnection(con);
			
			qnaList = qnaDAO.selectQnaList(page, limit, loginId, loginAuthor, sOption, sKeyword, filterList);
			
		}catch(Exception e) {
			System.out.println("관리자문의목록조회오류:"+e);
			
		}finally {
			close(con);
		}
		
		
		return qnaList;
	}
	
}
