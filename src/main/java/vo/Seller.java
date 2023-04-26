package vo;

public class Seller {

	private String seller_id;
	private String seller_pw;
	private String seller_name;
	private String seller_number;
	private int seller_author;
	
	public Seller() {};
	 
	public Seller(String seller_id, String seller_pw, String seller_name, String seller_number, int seller_author) {
		super();
		this.seller_id = seller_id;
		this.seller_pw = seller_pw;
		this.seller_name = seller_name;
		this.seller_number = seller_number;
		this.seller_author = seller_author;
	}

	public String getSeller_id() {
		return seller_id;
	} 
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getSeller_number() {
		return seller_number;
	}
	public void setSeller_number(String seller_number) {
		this.seller_number = seller_number;
	}
	public String getSeller_pw() {
		return seller_pw;
	}
	public void setSeller_pw(String seller_pw) {
		this.seller_pw = seller_pw;
	}
	public String getSeller_name() {
		return seller_name;
	}
	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}
	public int getSeller_author() {
		return seller_author;
	}
	public void setSeller_author(int seller_author) {
		this.seller_author = seller_author;
	}
	
	
	
	
}
