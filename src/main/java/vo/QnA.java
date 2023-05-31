package vo;

public class QnA {
	
	public int qnA_id;
	public String member_id;
	public String qnA_category;
	public String qnA_subject;
	public String qnA_contents;
	public String qnA_files;
	public String qnA_reply;
	
	
	public QnA() {}
	

	public QnA(String member_id, String qnA_category, String qnA_subject, String qnA_contents,
			String qnA_files, String qnA_reply) {
		super();
		
		this.member_id = member_id;
		this.qnA_category = qnA_category;
		this.qnA_subject = qnA_subject;
		this.qnA_contents = qnA_contents;
		this.qnA_files = qnA_files;
		this.qnA_reply = qnA_reply;
	}


	@Override
	public String toString() {
		return "qnA [qnA_id=" + qnA_id + ", member_id=" + member_id + ", qnA_category=" + qnA_category
				+ ", qnA_subject=" + qnA_subject + ", qnA_contents=" + qnA_contents + ", qnA_files=" + qnA_files
				+ ", qnA_reply=" + qnA_reply + "]";
	}


	public int getQnA_id() {
		return qnA_id;
	}


	public void setQnA_id(int qnA_id) {
		this.qnA_id = qnA_id;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public String getQnA_category() {
		return qnA_category;
	}


	public void setQnA_category(String qnA_category) {
		this.qnA_category = qnA_category;
	}


	public String getQnA_subject() {
		return qnA_subject;
	}


	public void setQnA_subject(String qnA_subject) {
		this.qnA_subject = qnA_subject;
	}


	public String getQnA_contents() {
		return qnA_contents;
	}


	public void setQnA_contents(String qnA_contents) {
		this.qnA_contents = qnA_contents;
	}


	public String getQnA_files() {
		return qnA_files;
	}


	public void setQnA_files(String qnA_files) {
		this.qnA_files = qnA_files;
	}


	public String getQnA_reply() {
		return qnA_reply;
	}


	public void setQnA_reply(String qnA_reply) {
		this.qnA_reply = qnA_reply;
	}



	
	
	
	
	
}
