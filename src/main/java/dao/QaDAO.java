package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import vo.Qa;

import static db.JdbcUtil.*;

public class QaDAO {
	private static QaDAO qaDAO;
	Connection con;

	//private 기본생성자
	private QaDAO() {super();}

	public static QaDAO getInstance() {
		if(qaDAO == null) {
			qaDAO = new QaDAO();
		}

		return qaDAO;
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
	public ArrayList<Qa> selectQnaList(int page, int limit, String loginId) {
		ArrayList<Qa> qnaList = new ArrayList<>();
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
					Qa qna = new Qa();
					qna.setQna_id(rs.getInt("qna_id")); //qna_id
					qna.setQna_category(rs.getInt("qna_category"));//문의분류
					qna.setQna_subject(rs.getString("qna_subject"));//문의제목
					qna.setQna_content(rs.getString("qna_content"));//문의내용
					qna.setQna_isanswer(rs.getString("qna_isanswer"));//답변여부
					qna.setQna_file(rs.getString("qna_file"));//첨부파일
					qna.setQna_qdate(rs.getDate("qna_qdate"));//등록일
					qna.setQna_adate(rs.getDate("qna_adate"));//답변일
					qna.setQna_a_content(rs.getString("qna_a_content"));//답변내용

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
	public int insertQuestion(Qa qna) {
		System.out.println(qna);

		int result = 0;
		PreparedStatement psmt = null;
		String cols = "qna_category, qna_author, qna_subject, qna_content, member_id, qna_qdate";
		String filters = "";
		

		System.out.println(cols);

		if(qna.getQna_file() == null || qna.getQna_file().equals("")) {

		}else {//첨부파일 있다면
			System.out.println("파일있음");
			cols += ", qna_file";
			filters += ", '"+qna.getQna_file()+"'";
		}

		if(qna.getGongu_id() > 0) { //gongu_id 있다면
			 cols += ", gongu_id";
			 filters += ", "+qna.getGongu_id();
		}

		if(qna.getOrder_id() > 0) { //order_id 있다면
			 cols += ", order_id";
			 filters += ", "+qna.getOrder_id();
		}
		
		String sql = "INSERT INTO qna ("+cols+") VALUES(?,?,?,?,?,now()"+filters+")";
		
		
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

	public Qa selectQna(int qna_id) {
		Qa qna = new Qa();
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
		
		String cnt_tbls = "";
		String cnt_filters = "";

		
		//조건2. 판매자 or 관리자 판매자면 gongu_id || order_id로 조인 후 seller_id 가지고 와야함
		if(loginAuthor > 0) {
			cnt_tbls += "(SELECT q.*, g.seller_id AS sellerId "
					+ "FROM qna q "
					+ "INNER JOIN orders o ON q.order_id = o.order_id "
					+ "JOIN gongu g ON o.gongu_id = g.gongu_id "
					+ "WHERE q.order_id IS NOT NULL "
					+ "UNION "
					+ "SELECT q.*, g.seller_id AS sellerId "
					+ "FROM qna q "
					+ "INNER JOIN gongu g ON q.gongu_id = g.gongu_id "
					+ "WHERE q.gongu_id IS NOT NULL) AS tbl";
			
			cnt_filters = " WHERE tbl.qna_author = 1 "
					+ "AND tbl.sellerId='"+loginId+"' ";
			
		}else {
			cnt_tbls += "qna";
			cnt_filters += " WHERE qna_author >= 0 ";
		}
		
		//조건1. 필터(필수로 들어감)
		if(filterList.size() >= 1 && !(filterList.get(0).equals("all"))) {//선택된 공구조건이 1개 이상이고 그 하나가 all(전체)이 아닐때만 실행  
			cnt_filters += " AND qna_category IN(";
			for(int i=0; i<filterList.size(); i++) {
				cnt_filters += filterList.get(i);
				if(i<filterList.size()-1) {
					cnt_filters += ",";
				}
			}
			cnt_filters += ")";

		}else {//공구조건이 all일때만 실행 -> all이면 조건 안붙여도 되는데 하는 이유 : 조건절 시작을 위해 WHERE 붙여야되서
			cnt_filters += " AND qna_category >= 0"; 
		}
		
		System.out.println("필터링2:"+cnt_filters);
		
		//조건3. 검색조건 유무
		if(sOption != null && sKeyword != null) {
			cnt_filters += " AND "+ sOption + " LIKE '%"+sKeyword+"%'";

		}
		
		String sql = "SELECT count(*) FROM "+ cnt_tbls + cnt_filters; //시스템 - 검색조건 없음

		try {
			psmt = con.prepareStatement(sql);
			System.out.println("문의목록개수선택쿼리"+psmt);
			rs = psmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1); //첫번째 컬럼값(count 함수 결과) 가져오기
			}

		}catch(Exception e) {
			System.out.println("관리자문의갯수선택오류:"+e);

		}finally {
			close(rs);
			close(psmt);
		}

		return listCount;
	}

	//관리자문의목록
	public ArrayList<Qa> selectQnaList(int page, int limit, String loginId, int loginAuthor, String sOption,
			String sKeyword, ArrayList<String> filterList) {

		ArrayList<Qa> qnaList = new ArrayList<>();
		PreparedStatement psmt = null;
		ResultSet rs = null;

		int startRow = (page-1)*limit; //시작행

		String cnt_tbls = "";
		String cnt_filters = "";

		
		//조건2. 판매자 or 관리자 판매자면 gongu_id || order_id로 조인 후 seller_id 가지고 와야함
		if(loginAuthor > 0) {
			cnt_tbls += "(SELECT q.*, g.seller_id AS sellerId "
					+ "FROM qna q "
					+ "INNER JOIN orders o ON q.order_id = o.order_id "
					+ "JOIN gongu g ON o.gongu_id = g.gongu_id "
					+ "WHERE q.order_id IS NOT NULL "
					+ "UNION "
					+ "SELECT q.*, g.seller_id AS sellerId "
					+ "FROM qna q "
					+ "INNER JOIN gongu g ON q.gongu_id = g.gongu_id "
					+ "WHERE q.gongu_id IS NOT NULL) AS tbl";
			
			cnt_filters += " WHERE tbl.qna_author = 1 "
					+ "AND tbl.sellerId='"+loginId+"' ";
			
		}else {
			cnt_tbls += "qna";
			cnt_filters += " WHERE qna_author >= 0 ";
		}
		
		//조건1. 필터(필수로 들어감)
		if(filterList.size() >= 1 && !(filterList.get(0).equals("all"))) {//선택된 공구조건이 1개 이상이고 그 하나가 all(전체)이 아닐때만 실행  
			cnt_filters += " AND qna_category IN(";
			for(int i=0; i<filterList.size(); i++) {
				cnt_filters += filterList.get(i);
				if(i<filterList.size()-1) {
					cnt_filters += ",";
				}
			}
			cnt_filters += ")";

		}else {//공구조건이 all일때만 실행 -> all이면 조건 안붙여도 되는데 하는 이유 : 조건절 시작을 위해 WHERE 붙여야되서
			cnt_filters += " AND qna_category >= 0"; 
		}
		
		//조건3. 검색조건 유무
		if(sOption != null && sKeyword != null) {
			cnt_filters += " AND "+ sOption + " LIKE '%"+sKeyword+"%'";

		}
		
		String sql = "SELECT * FROM "+ cnt_tbls + cnt_filters + " ORDER BY qna_qdate DESC limit ?,?"; //시스템 - 검색조건 없음
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, startRow);
			psmt.setInt(2, limit);
			System.out.println("문의목록선택쿼리:"+psmt);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				do {
					Qa qna = new Qa();
					qna.setQna_id(rs.getInt("qna_id"));
					qna.setQna_category(rs.getInt("qna_category"));
					qna.setQna_author(rs.getInt("qna_author"));
					qna.setQna_subject(rs.getString("qna_subject"));
					qna.setQna_isanswer(rs.getString("qna_isanswer"));
					qna.setQna_qdate(rs.getDate("qna_qdate"));
					qna.setQna_adate(rs.getDate("qna_adate"));
					qna.setMember_id(rs.getString("member_id"));
					
					qnaList.add(qna);
					
				}while(rs.next());	
			}
			
			
		}catch(Exception e) {
			System.out.println("관리자문의목록선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}



		return qnaList;
	}
	
	//관리자&판매자 미응답
	public int selectNoAnswerCnt(String loginId, int loginAuthor) {
		int count = 0;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String tbls = "qna";
		String filter = "qna_isanswer = '0'";

		//조건:관리자인지 판매자인지 체크, 판매자라면 if에 걸림
		if(loginAuthor > 0) {
			tbls = "(SELECT q.*, g.seller_id AS sellerId "
					+ "FROM qna q "
					+ "INNER JOIN orders o ON q.order_id = o.order_id "
					+ "JOIN gongu g ON o.gongu_id = g.gongu_id "
					+ "WHERE q.order_id IS NOT NULL "
					+ "UNION "
					+ "SELECT q.*, g.seller_id AS sellerId "
					+ "FROM qna q "
					+ "INNER JOIN gongu g ON q.gongu_id = g.gongu_id "
					+ "WHERE q.gongu_id IS NOT NULL) AS tbl";
			
			filter = "tbl.qna_isanswer = 0 "
					+ "AND tbl.qna_author = 1 "
					+ "AND tbl.sellerId='"+loginId+"'";
			
		}else {
			
			filter += " AND qna_category > 10 AND qna_author=0";
		}
		
		String sql = "SELECT COUNT(*) FROM "+tbls+" WHERE "+filter;
		
		try {
			psmt = con.prepareStatement(sql);
			System.out.println("관리자미응답쿼리:"+psmt);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			
		}catch(Exception e) {
			System.out.println("관리자미응답문의갯수선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}

		
		return count;
	}
	
	//관리자 문의상세보기
	public HashMap<String, Object> selectAdminQna(int qna_id, int qna_category) {
		HashMap<String,Object> qna = new HashMap<String,Object>();
		PreparedStatement psmt = null;
		ResultSet rs = null;

		String tbls = "";
		
		//rs에 같은 데이터를 담기 위해 조회 컬럼은 그대로 하고, 문의유형이 공구인지 주문인지에 따라 조인 테이블을 다르게 함
		
		if(qna_category == 0) {//공구일때, gongu_id 있음
			tbls += "LEFT JOIN gongu g ON q.gongu_id = g.gongu_id ";
			tbls += "LEFT JOIN orders o ON g.gongu_id = o.gongu_id ";
			tbls += "LEFT JOIN member m ON q.member_id = m.member_id ";
			
		}else if(0 < qna_category && qna_category < 20){//주문일때, order_id있음
	
			tbls += "LEFT JOIN orders o ON q.order_id = o.order_id ";
			tbls += "LEFT JOIN gongu g ON o.gongu_id = g.gongu_id ";
			tbls += "LEFT JOIN member m ON q.member_id = m.member_id ";
			
		}else {
			tbls += "LEFT JOIN orders o ON q.order_id = o.order_id ";
			tbls += "LEFT JOIN gongu g ON o.gongu_id = g.gongu_id ";
			tbls += "LEFT JOIN member m ON q.member_id = m.member_id ";
		}
		
		//컬럼을 q.*로 qna 전체로 했더니 공구아이디와 주문아이디가 중복이 되어 각자 컬럼 선택
		String sql = "SELECT q.qna_id, q.qna_category, q.qna_author, q.qna_subject, q.qna_content, q.qna_file,"
					+ "q.qna_isanswer,q.member_id,q.qna_qdate,q.qna_adate,q.qna_a_content,"
					+ "g.gongu_id AS gonguId, g.gongu_name AS gonguName, g.seller_id AS sellerId,"
					+ "o.order_id AS orderId, CONCAT(o.order_date, ' ', LEFT(g.gongu_name, 10), '...') AS order_info "		
					+ "FROM qna q "
					+ tbls
					+ "WHERE qna_id = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1,qna_id);
			System.out.println(psmt);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				qna.put("qna_id", rs.getInt("qna_id"));
				qna.put("qna_category", rs.getInt("qna_category"));
				qna.put("qna_author", rs.getInt("qna_author"));
				qna.put("qna_subject", rs.getString("qna_subject"));
				qna.put("qna_content", rs.getString("qna_content"));
				qna.put("qna_file", rs.getString("qna_file"));
				qna.put("qna_isanswer", rs.getString("qna_isanswer"));
				qna.put("qna_qdate", rs.getString("qna_qdate"));
				qna.put("qna_adate", rs.getDate("qna_adate"));
				qna.put("member_id", rs.getString("member_id"));
				qna.put("qna_a_content", rs.getString("qna_a_content"));
				qna.put("gongu_id", rs.getInt("gonguId"));
				qna.put("gongu_name", rs.getString("gonguName"));
				qna.put("seller_id", rs.getString("sellerId"));
				qna.put("order_id", rs.getInt("orderId"));
				qna.put("order_info", rs.getString("order_info")); //주문날짜 + 공구명 10자리
			}
			
			System.out.println("qna:"+qna);
			
			
		}catch(Exception e) {
			System.out.println("관리자문의선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		
		return qna;
	}

	public int insertAnswer(int qna_id, String answer, String seller_id) {
		int count = 0;
		PreparedStatement psmt = null;
		String sql = "UPDATE qna SET qna_a_content = ?, qna_adate = now(), qna_isanswer = '1' WHERE qna_id = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, answer);
			psmt.setInt(2, qna_id);
			
			count = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("관리자답변업데이트오류:"+e);
			
		}finally {
			close(psmt);
		}
		
		return count;
	}

	public int updateQnaAuthor(int qna_id) {
		int count = 0;
		PreparedStatement psmt = null;
		String sql = "UPDATE qna SET qna_author = 1 WHERE qna_id = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, qna_id);
			
			count = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("관리자답변넘기기업데이트오류:"+e);
			
		}finally {
			close(psmt);
		}
		
		
		
		return count;
	}



}