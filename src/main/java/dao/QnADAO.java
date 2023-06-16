package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.QnA;

public class QnADAO {
	
	private static QnADAO qnaDAO;
	Connection con =null;
	
	private QnADAO() {}
	
	public static QnADAO getInstance() {
		if (qnaDAO == null) {
			qnaDAO = new QnADAO();
		}

		return qnaDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertQnA(QnA qna) {
		PreparedStatement pstmt = null;
		String sql = "insert into qna_board(member_id,qna_category,qna_subject,qna_contents,qna_files)"
				+ "values(?,?,?,?,?) ";
		int insertChk = 0;
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, qna.getMember_id());
			pstmt.setString(2, qna.getQnA_category());
			pstmt.setString(3, qna.getQnA_subject());
			pstmt.setString(4,qna.getQnA_contents());
			pstmt.setString(5, qna.getQnA_files());
			System.out.println(pstmt);
			insertChk = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return insertChk;
	}
	
	
	public ArrayList<QnA> memberQnAList(String member_id){
		ArrayList<QnA>memberQnAList = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "select * from qna_board where member_id = '"+member_id+"'";
		try {
			pstmt = con.prepareStatement(sql);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberQnAList = new ArrayList<QnA>();
				do {
					
					memberQnAList.add(new QnA(
							rs.getString("member_id"),							
							rs.getString("qna_category"),
							rs.getString("qna_subject"),
							rs.getString("qna_contents"),
							rs.getString("qna_files"),
							rs.getString("reply")
							));
				}while(rs.next());
				
			}
			System.out.println(memberQnAList.toString());
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		
		return memberQnAList;
	}
	
	
}
