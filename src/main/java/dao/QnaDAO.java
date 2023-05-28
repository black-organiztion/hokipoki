package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.Qna;

import static db.JdbcUtil.*;

public class QnaDAO {
	private static QnaDAO qnaDAO;
	Connection con;
	
	//private 기본생성자
	private QnaDAO() {super();}
	
	public static QnaDAO getInstance() {
		if(qnaDAO == null) {
			qnaDAO = new QnaDAO();
		}
		
		return qnaDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	//일반회원
	public int selectListCount(String loginId) {
		int listCount = 0;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM qna WHERE member_id = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, loginId);
			System.out.println(psmt);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		}catch(Exception e) {
			System.out.println("회원문의갯수선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		return listCount;
	}
	//일반회원문의목록
	public ArrayList<Qna> selectQnaList(int page, int limit, String loginId) {
		ArrayList<Qna> qnaList = new ArrayList<>();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM qna WHERE member_id = ? ORDER BY qna_qdate DESC limit ?, ?";
		int startRow = (page-1)*limit; //시작행
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, loginId);
			psmt.setInt(2, startRow);
			psmt.setInt(3, limit);
			System.out.println(psmt);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				do {
					Qna qna = new Qna();
					qna.setQna_id(rs.getInt("qna_id")); //qna_id
					qna.setQna_category(rs.getInt("qna_category"));//문의분류
					qna.setQna_subject(rs.getString("qna_subject"));//문의제목
					qna.setQna_isanswer(rs.getString("qna_isanswer"));//답변여부
					qna.setQna_qdate(rs.getDate("qna_qdate"));//등록일
					
					qnaList.add(qna);
					
				}while(rs.next());
			}
			
		}catch(Exception e) {
			System.out.println("회원문의목록선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		return qnaList;
	}
	
	//일반회원문의등록
	public int insertQuestion(Qna qna) {
		System.out.println(qna);
		
		int result = 0;
		PreparedStatement psmt = null;
		String cols = "qna_category, seller_id, qna_author, qna_subject, qna_content, member_id, qna_qdate";
		String sql = "INSERT INTO qna ("+cols+") VALUES(?, "+qna.getSeller_id()+",?,?,?,?,now(),?";
		
		System.out.println(cols);
		System.out.println(sql);
		
		if(qna.getQna_file() == null || qna.getQna_file().equals("")) {
			
		}else {//첨부파일 있다면
			System.out.println("파일있음");
			cols += ", qna_file";
			sql += ", '"+qna.getQna_file()+"'";
		}
		
		if(qna.getGongu_id() > 0) { //gongu_id 있다면
			 cols += ", gongu_id";
			 sql += ", '"+qna.getGongu_id()+"'";
		}
		
		if(qna.getOrder_id() > 0) { //order_id 있다면
			 cols += ", order_id";
			 sql += ", '"+qna.getOrder_id()+"'";
		}
		sql +=")";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, qna.getQna_category());
			psmt.setInt(2, qna.getQna_author());
			psmt.setString(3, qna.getQna_subject());
			psmt.setString(4, qna.getQna_content());
			psmt.setString(5, qna.getMember_id());
			System.out.println(psmt);
			
			result = psmt.executeUpdate();
			
			
		}catch(Exception e) {
			System.out.println("회원문의insert오류:"+e);
			
		}finally {
			close(psmt);
		}
		
		return result;
	}

	public Qna selectQna(int qna_id) {
		Qna qna = new Qna();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM qna WHERE qna_id = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1,qna_id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				qna.setQna_id(rs.getInt("qna_id"));
				qna.setQna_category(rs.getInt("qna_category"));
				qna.setQna_author(rs.getInt("qna_author"));
				qna.setQna_subject(rs.getString("qna_subject"));
				qna.setQna_pw(rs.getString("qna_pw"));
				qna.setQna_content(rs.getString("qna_content"));
				qna.setQna_file(rs.getString("qna_file"));
				qna.setQna_isanswer(rs.getString("qna_isanswer"));
				qna.setQna_qdate(rs.getDate("qna_qdate"));
				qna.setQna_adate(rs.getDate("qna_adate"));
				qna.setMember_id(rs.getString("member_id"));
				qna.setGongu_id(rs.getInt("gongu_id"));
				qna.setOrder_id(rs.getInt("order_id"));
				qna.setQna_a_content(rs.getString("qna_a_content"));
				qna.setSeller_id(rs.getString("seller_id"));
				
			}
			
		}catch(Exception e) {
			System.out.println("문의선택오류:"+e);
		}finally {
			close(rs);
			close(psmt);
		}
		
		
		return qna;
	}
	
	
	//관리자 문의갯수
	public int selectListCount(String loginId, int loginAuthor, String sOption, String sKeyword,
			ArrayList<String> filterList) {
		
		int listCount = 0;
		PreparedStatement psmt =  null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM qna"; //시스템 - 검색조건 없음
		
		//조건1. 필터(필수로 들어감)
		if(filterList.size() >= 1 && !(filterList.get(0).equals("all"))) {//선택된 공구조건이 1개 이상이고 그 하나가 all(전체)이 아닐때만 실행  
			sql += " WHERE qna_category IN(";
			for(int i=0; i<filterList.size(); i++) {
				sql += filterList.get(i);
				if(i<filterList.size()-1) {
					sql += ",";
				}
			}
			sql += ")";
			
		}else {//공구조건이 all일때만 실행 -> all이면 조건 안붙여도 되는데 하는 이유 : 조건절 시작을 위해 WHERE 붙여야되서
			sql += " WHERE qna_category >= 0"; 
		}
		
		//조건2. 판매자 or 관리자 판매자면 gongu_id || order_id로 조인 후 seller_id 가지고 와야함
		if(loginAuthor > 0) {
			sql += " AND seller_id='"+loginId+"'";
		}
		//조건3. 검색조건 유무
		if(sOption != null && sKeyword != null) {
			sql += " AND "+ sOption + " LIKE '%"+sKeyword+"%'";
					
		}
		
		try {
			psmt = con.prepareStatement(sql);
			System.out.println("문의개수선택쿼리"+psmt);
			rs = psmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1); //첫번째 컬럼값(count 함수 결과) 가져오기
			}
			
		}catch(Exception e) {
			System.out.println("문의갯수선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		return listCount;
	}
	
	//관리자문의목록
	public ArrayList<Qna> selectQnaList(int page, int limit, String loginId, int loginAuthor, String sOption,
			String sKeyword, ArrayList<String> filterList) {

		ArrayList<Qna> qnaList = new ArrayList<>();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM qna";
		
		int startRow = (page-1)*limit; //시작행
		
		//조건1. 필터(필수로 들어감)
		if(filterList.size() >= 1 && !(filterList.get(0).equals("all"))) {//선택된 공구조건이 1개 이상이고 그 하나가 all(전체)이 아닐때만 실행  
			sql += " WHERE qna_category IN(";
			for(int i=0; i<filterList.size(); i++) {
				sql += filterList.get(i);
				if(i<filterList.size()-1) {
					sql += ",";
				}
			}
			sql += ")";
			
		}else {//공구조건이 all일때만 실행 -> all이면 조건 안붙여도 되는데 하는 이유 : 조건절 시작을 위해 WHERE 붙여야되서
			sql += " WHERE qna_category >= 0"; 
		}
		
		//조건2. 판매자 or 관리자 (판매자면 seller_id = loginId 조건)
		if(loginAuthor > 0) {
			sql += " AND seller_id='"+loginId+"'";
		}
		//조건3. 검색조건 유무
		if(sOption != null && sKeyword != null) {
			sql += " AND "+ sOption + " LIKE '%"+sKeyword+"%'";
					
		}
		
		
		
		return qnaList;
	}
	
	
	
}
