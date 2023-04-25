package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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

	/*
	 * public String selectLogin(Member member) { String loginId = null; String sql
	 * = "select member_id from member1 where member_id = ? and member_pw = ?";
	 * 
	 * try { pstmt = con.prepareStatement(sql); pstmt.setString(1,
	 * member.getMember_id()); pstmt.setString(2, member.getMember_pw()); rs =
	 * pstmt.executeQuery();
	 * 
	 * if (rs.next()) { loginId = rs.getString("member_id"); }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally { close(rs);
	 * close(pstmt); } return loginId;
	 * 
	 * }
	 */

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
			System.out.println("pstmt:"+pstmt);
			
			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return insertCount;
	}

	/*
	 * public ArrayList<MemberBean> selectMemberList() { String sql =
	 * "select * from member1"; ArrayList<MemberBean> memberList = new
	 * ArrayList<MemberBean>(); MemberBean mb = null;
	 * 
	 * try { pstmt = con.prepareStatement(sql); System.out.println("1"); rs =
	 * pstmt.executeQuery();
	 * 
	 * if (rs.next()) { do { mb = new MemberBean();
	 * mb.setMember_id(rs.getString("member_id"));
	 * mb.setMember_pw(rs.getString("member_pw"));
	 * mb.setMember_name(rs.getString("member_name"));
	 * mb.setMember_gender(rs.getString("member_gender"));
	 * mb.setMember_email(rs.getString("member_email"));
	 * mb.setMember_age(rs.getInt("member_age")); memberList.add(mb); } while
	 * (rs.next()); }
	 * 
	 * } catch (Exception e) { System.out.println("dao selectmemberList에서 오류발생");
	 * e.printStackTrace(); } finally { close(rs); close(pstmt); } return
	 * memberList; }
	 */
	/*
	 * public MemberBean selectMember(String id) { MemberBean member = null;
	 * PreparedStatement pstmt = null; ResultSet rs = null; String sql =
	 * "select * from member1 where member_id = ?"; try { pstmt =
	 * con.prepareStatement(sql);
	 * 
	 * pstmt.setString(1, id); rs = pstmt.executeQuery(); if (rs.next()) { member =
	 * new MemberBean(); member.setMember_id(rs.getString("member_id"));
	 * member.setMember_pw(rs.getString("member_pw"));
	 * member.setMember_name(rs.getString("member_name"));
	 * member.setMember_gender(rs.getString("member_gender"));
	 * member.setMember_email(rs.getString("member_email"));
	 * member.setMember_age(Integer.parseInt(rs.getString("member_age"))); } } catch
	 * (Exception e) { e.printStackTrace(); } finally { close(rs); close(pstmt); }
	 * System.out.println(member.toString()); return member;
	 * 
	 * }
	 */

	/*
	 * public boolean MemberDelete(String id) { boolean deleteResult = false; int
	 * count = 0;
	 * 
	 * String sql = "delete from member1 where member_id = ?";
	 * 
	 * try { pstmt = con.prepareStatement(sql); pstmt.setString(1, id); count =
	 * pstmt.executeUpdate(); System.out.println("count:" + count); if (count > 0) {
	 * deleteResult = true; }
	 * 
	 * if(deleteResult) { con.commit(); }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally { close(pstmt);
	 * 
	 * } return deleteResult; }
	 */

	/*
	 * public boolean updateMember(Member member) { int count = 0; boolean modResult
	 * = false; String sql =
	 * "update from member1 set meber_name = ?, member_age = ?, member_gen = ?, member_email = ?,"
	 * ;
	 * 
	 * if (member.getMember_pw() != null) { sql += "member_pw = " +
	 * member.getMember_pw(); } sql += "where member_id = ?";
	 * 
	 * try { pstmt = con.prepareStatement(sql); pstmt.setString(1,
	 * member.getMember_name()); pstmt.setInt(2, member.getMember_age());
	 * pstmt.setString(3, member.getMember_gender()); pstmt.setString(4,
	 * member.getMember_email()); pstmt.setString(5, member.getMember_id()); count =
	 * pstmt.executeUpdate(); System.out.println("count:" + count); if (count > 0) {
	 * modResult = true; }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally { close(pstmt);
	 * 
	 * } return modResult;
	 * 
	 * }
	 */

}
