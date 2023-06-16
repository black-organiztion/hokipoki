package vo;

import java.sql.Date;

public class Qa {
	private int qna_id;
	private int qna_category;
	private int qna_author;
	private String qna_subject;
	private String qna_pw;
	private String qna_content;
	private String qna_file;
	private String qna_isanswer;
	private Date qna_qdate;
	private Date qna_adate;
	private String member_id;
	private int gongu_id;
	private int order_id;
	private String qna_a_content;
	private String seller_id;
	
	public Qa() {super();}

	public Qa(int qna_id, int qna_category, int qna_author, String qna_subject, String qna_pw, String qna_content,
			String qna_file, String qna_isanswer, Date qna_qdate, Date qna_adate, String member_id, int gongu_id,
			int order_id, String qna_a_content, String seller_id) {
		super();
		this.qna_id = qna_id;
		this.qna_category = qna_category;
		this.qna_author = qna_author;
		this.qna_subject = qna_subject;
		this.qna_pw = qna_pw;
		this.qna_content = qna_content;
		this.qna_file = qna_file;
		this.qna_isanswer = qna_isanswer;
		this.qna_qdate = qna_qdate;
		this.qna_adate = qna_adate;
		this.member_id = member_id;
		this.gongu_id = gongu_id;
		this.order_id = order_id;
		this.qna_a_content = qna_a_content;
		this.seller_id = seller_id;
	}

	public int getQna_id() {
		return qna_id;
	}

	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
	}

	public int getQna_category() {
		return qna_category;
	}

	public void setQna_category(int qna_category) {
		this.qna_category = qna_category;
	}

	public int getQna_author() {
		return qna_author;
	}

	public void setQna_author(int qna_author) {
		this.qna_author = qna_author;
	}

	public String getQna_subject() {
		return qna_subject;
	}

	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}

	public String getQna_pw() {
		return qna_pw;
	}

	public void setQna_pw(String qna_pw) {
		this.qna_pw = qna_pw;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_file() {
		return qna_file;
	}

	public void setQna_file(String qna_file) {
		this.qna_file = qna_file;
	}

	public String getQna_isanswer() {
		return qna_isanswer;
	}

	public void setQna_isanswer(String qna_isanswer) {
		this.qna_isanswer = qna_isanswer;
	}

	public Date getQna_qdate() {
		return qna_qdate;
	}

	public void setQna_qdate(Date qna_qdate) {
		this.qna_qdate = qna_qdate;
	}

	public Date getQna_adate() {
		return qna_adate;
	}

	public void setQna_adate(Date qna_adate) {
		this.qna_adate = qna_adate;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getGongu_id() {
		return gongu_id;
	}

	public void setGongu_id(int gongu_id) {
		this.gongu_id = gongu_id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public String getQna_a_content() {
		return qna_a_content;
	}

	public void setQna_a_content(String qna_a_content) {
		this.qna_a_content = qna_a_content;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	@Override
	public String toString() {
		return "Qa [qna_id=" + qna_id + ", qna_category=" + qna_category + ", qna_author=" + qna_author
				+ ", qna_subject=" + qna_subject + ", qna_pw=" + qna_pw + ", qna_content=" + qna_content + ", qna_file="
				+ qna_file + ", qna_isanswer=" + qna_isanswer + ", qna_qdate=" + qna_qdate + ", qna_adate=" + qna_adate
				+ ", member_id=" + member_id + ", gongu_id=" + gongu_id + ", order_id=" + order_id + ", qna_a_content="
				+ qna_a_content + ", seller_id=" + seller_id + "]";
	}
	
	
}
