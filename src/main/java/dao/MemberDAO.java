package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import javax.sql.DataSource;

import vo.Member;

public class MemberDAO {

	public static MemberDAO instance;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;

	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		if (instance == null) {
			instance = new MemberDAO();
		}

		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public String selectLogin(Member member) {
		String loginId = null;
		String sql = "select member_id from member where member_id = ? and member_pw = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getMember_id());
			pstmt.setString(2, member.getMember_pw());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				loginId = rs.getString("member_id");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return loginId;

	}

	public int insertMember(Member member) {

		String sql = "insert into member values (?,?,?,?,?,now(),?,?)";
		int insertCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getMember_id());
			pstmt.setString(2, member.getMember_pw());
			pstmt.setString(3, member.getMember_name());
			pstmt.setString(4, member.getMember_tel());
			pstmt.setString(5, member.getMember_email());
			pstmt.setString(6, member.getMembership_id());
			pstmt.setString(7, member.getRecommend_id());
			System.out.println("pstmt:" + pstmt);

			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return insertCount;
	}

	public boolean idcheckMember(String id) {
		String sql = "select member_id from member where member_id = "+id;
		boolean idchkflag = false;
		try {
			pstmt = con.prepareStatement(sql);			
			System.out.println("idcheckMember pstmt:" + pstmt);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				idchkflag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return idchkflag;
	}
	
	public Member returnMember(String member_id) {
		Member member = null;
		String sql = "select * from member where member_id = ?";

		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();	
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  		      

			if (rs.next()) {
				member= new Member();
				member.setMember_email(rs.getString("member_email"));
				member.setMember_id(member_id);
				member.setMember_name(rs.getString("member_name"));
				member.setMember_pw(rs.getString("member_pw"));
				member.setMember_tel(rs.getString("member_tel"));
				member.setMember_date(format.parse(rs.getString("member_date")));
				member.setMembership_id(rs.getString("membership_id"));
				member.setRecommend_id(rs.getString("recommend_id"));			
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return member;
	}

	public boolean dupIdCheck(String id) {
		boolean flag= false;
		PreparedStatement pstmt = null;
		
		String sql = "select member_id from member where member_id = ?";	
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			System.out.println("pstmt:"+pstmt);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				flag = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return flag;
	}

	public int checkDupl(String userId) {
		int result = 0;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM member WHERE member_id = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
				
			}else {
				result = 0;
			}
			
		}catch(Exception e) {
			e.printStackTrace();			
		}finally {
			close(rs);
			close(psmt);
		}
		
		return result;
	}

	public boolean pwchk(String pw, String id) {
		boolean flag = false;
		String sql = "select member_pw from member where member_id = '"+id+"'";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(sql);
			System.out.println(pstmt);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			do {
				if(pw.equals(rs.getString("member_pw"))) flag=true;
			}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return flag;
	}




    


}
