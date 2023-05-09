package vo;

import java.time.LocalDate;
import java.util.Date;

public class Member {

	private String member_id;
	private String membership_id;
	private String member_name;
	private String member_pw;
	private String member_tel;  
	private String member_email;
	private String recommend_id;
	private Date member_date;
	
	public Member() {super();}
	
	public Member(String member_id, String membership_id, String member_pw, String member_name, String member_tel,
			String member_email, String recommend_id, Date member_date) {
		super();
		this.member_id = member_id;
		this.membership_id = membership_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_tel = member_tel;
		this.member_email = member_email;
		this.recommend_id = recommend_id;
		this.member_date = member_date;
	}
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMembership_id() {
		return membership_id;
	}
	public void setMembership_id(String membership_id) {
		this.membership_id = membership_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getRecommend_id() {
		return recommend_id;
	}
	public void setRecommend_id(String recommend_id) {
		this.recommend_id = recommend_id;
	}
	public Date getMember_date() {
		return member_date;
	}
	public void setMember_date(Date member_date) {
		this.member_date = member_date;
	}
	
	
	
}
