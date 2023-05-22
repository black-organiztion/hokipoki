package vo;

public class MemberOrderGongu {
	
	private String gongu_name;
	private String gongu_thimg;
	private String order_date;
	private String order_id;
	private String order_price;
	private String order_status;
	
	
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getGongu_name() {
		return gongu_name;
	}
	public void setGongu_name(String gongu_name) {
		this.gongu_name = gongu_name;
	}
	public String getGongu_thimg() {
		return gongu_thimg;
	}
	public void setGongu_thimg(String gongu_thimg) {
		this.gongu_thimg = gongu_thimg;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getOrder_price() {
		return order_price;
	}
	public void setOrder_price(String order_price) {
		this.order_price = order_price;
	}
	
	public MemberOrderGongu() {}
	
	public MemberOrderGongu(String gongu_name, String gongu_thimg,  String order_id, String order_price,  String order_status, String order_date
			) {
		super();
		this.gongu_name = gongu_name;
		this.gongu_thimg = gongu_thimg;
		this.order_date = order_date;
		this.order_id = order_id;
		this.order_price = order_price;
		this.order_status = order_status;
	}
	
	
	
	
}
