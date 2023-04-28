package member.svc;
import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.GonguDAO;
import dao.MemberDAO;
import vo.Gongu;
import vo.Member;

public class GonguPurchaseService {

	public Gongu purchaseGongu(int gongu_id) {

		boolean gonguflag=false;
		Connection con = null;
		Gongu gongu = null;
		try {
			con=getConnection();			
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			gongu = gonguDAO.selectgongu(gongu_id);
	
			if (gongu!=null) {				
				gonguflag=true;
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return gongu;
	}

	
	public Member purchaseMember(String member_id) {

		boolean memberflag=false;
		Connection con = null;
		Member member = null;
		try {
			con=getConnection();
			MemberDAO memberDAO = MemberDAO.getInstance();			
			memberDAO.setConnection(con);
			member =memberDAO.returnMember(member_id);			
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return member;
	}

}
