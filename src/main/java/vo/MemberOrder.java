package vo;

public class MemberOrder {

	private int order_id;
	private int gongu_id;
	private String member_id;
	private int delivery_id;
	private String order_date; 
	private int order_count;
	private String order_end_date; 
	private int order_price;
	private char order_status;
	
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getGongu_id() {
		return gongu_id;
	}
	public void setGongu_id(int gongu_id) {
		this.gongu_id = gongu_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getDelivery_id() {
		return delivery_id;
	}
	public void setDelivery_id(int delivery_id) {
		this.delivery_id = delivery_id;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public int getOrder_count() {
		return order_count;
	}
	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}
	public String getOrder_end_date() {
		return order_end_date;
	}
	public void setOrder_end_date(String order_end_date) {
		this.order_end_date = order_end_date;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public char getOrder_status() {
		return order_status;
	}
	public void setOrder_status(char order_status) {
		this.order_status = order_status;
	}
	
	
	
	
}
