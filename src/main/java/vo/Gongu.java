package vo;

public class Gongu {

	public int gongu_id;
	public String category;
	public String seller_id;
	public String gongu_name; 
	public String gongu_price;  
	public String gongu_discount_price;
	public String gongu_date;
	public int gongu_view_count;
	public String gongu_status; 
	public String gongu_startdate;
	public String gongu_findate;
	public String gongu_stock; 
	public String gongu_reserve;
	public String gongu_min; 
	public String gongu_caldate;
	public String detail_img;
	public String thumbnail_img;
	
	
	public Gongu() {}
	
	public Gongu(int gongu_id, String category, String gongu_name, String gongu_price, String gongu_discount_price,
			String gongu_status, String gongu_startdate, String gongu_findate, String gongu_reserve, String gongu_min,
			String thumbnail_img) {
		super();
		this.gongu_id = gongu_id;
		this.category = category;
		this.gongu_name = gongu_name;
		this.gongu_price = gongu_price;
		this.gongu_discount_price = gongu_discount_price;
		this.gongu_status = gongu_status;
		this.gongu_startdate = gongu_startdate;
		this.gongu_findate = gongu_findate;
		this.gongu_reserve = gongu_reserve;
		this.gongu_min = gongu_min;
		this.thumbnail_img = thumbnail_img;
	}



	public String getDetail_img() {
		return detail_img;
	}

	public void setDetail_img(String detail_img) {
		this.detail_img = detail_img;
	}

	public String getThumbnail_img() {
		return thumbnail_img;
	}

	public void setThumbnail_img(String thumbnail_img) {
		this.thumbnail_img = thumbnail_img;
	}

	

	public int getGongu_id() {
		return gongu_id;
	}

	public void setGongu_id(int gongu_id) {
		this.gongu_id = gongu_id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public String getGongu_name() {
		return gongu_name;
	}

	public void setGongu_name(String gongu_name) {
		this.gongu_name = gongu_name;
	}

	public String getGongu_price() {
		return gongu_price;
	}

	public void setGongu_price(String gongu_price) {
		this.gongu_price = gongu_price;
	}

	public String getGongu_discount_price() {
		return gongu_discount_price;
	}

	public void setGongu_discount_price(String gongu_discount_price) {
		this.gongu_discount_price = gongu_discount_price;
	}

	public String getGongu_date() {
		return gongu_date;
	}

	public void setGongu_date(String gongu_date) {
		this.gongu_date = gongu_date;
	}

	public int getGongu_view_count() {
		return gongu_view_count;
	}

	public void setGongu_view_count(int gongu_view_count) {
		this.gongu_view_count = gongu_view_count;
	}

	public String getGongu_status() {
		return gongu_status;
	}

	public void setGongu_status(String gongu_status) {
		this.gongu_status = gongu_status;
	}

	public String getGongu_startdate() {
		return gongu_startdate;
	}

	public void setGongu_startdate(String gongu_startdate) {
		this.gongu_startdate = gongu_startdate;
	}

	public String getGongu_findate() {
		return gongu_findate;
	}

	public void setGongu_findate(String gongu_findate) {
		this.gongu_findate = gongu_findate;
	}

	public String getGongu_stock() {
		return gongu_stock;
	}

	public void setGongu_stock(String gongu_stock) {
		this.gongu_stock = gongu_stock;
	}

	public String getGongu_reserve() {
		return gongu_reserve;
	}

	public void setGongu_reserve(String gongu_reserve) {
		this.gongu_reserve = gongu_reserve;
	}

	public String getGongu_min() {
		return gongu_min;
	}

	public void setGongu_min(String gongu_min) {
		this.gongu_min = gongu_min;
	}

	public String getGongu_caldate() {
		return gongu_caldate;
	}

	public void setGongu_caldate(String gongu_caldate) {
		this.gongu_caldate = gongu_caldate;
	}

	@Override
	public String toString() {
		return "Gongu [gongu_id=" + gongu_id + ", category=" + category + ", seller_id=" + seller_id + ", gongu_name="
				+ gongu_name + ", gongu_price=" + gongu_price + ", gongu_discount_price=" + gongu_discount_price
				+ ", gongu_date=" + gongu_date + ", gongu_view_count=" + gongu_view_count + ", gongu_status="
				+ gongu_status + ", gongu_startdate=" + gongu_startdate + ", gongu_findate=" + gongu_findate
				+ ", gongu_stock=" + gongu_stock + ", gongu_reserve=" + gongu_reserve + ", gongu_min=" + gongu_min
				+ ", gongu_caldate=" + gongu_caldate + ", detail_img=" + detail_img + ", thumbnail_img=" + thumbnail_img
				+ "]";
	}

	

	
	
	
	
	
	
		
	
}
