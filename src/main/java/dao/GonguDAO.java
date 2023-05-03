package dao;
import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.Gongu;

public class GonguDAO {

	private static GonguDAO gonguDAO;
	private Connection con;

	private GonguDAO() {
	};// 다른 곳에서 생성자를 생성하는 걸 막기 위함 (싱글톤 방식이므로 dogdao객체는 getinstance방식으로만 생성해야 한다.)

	public static GonguDAO getInstance() {
		if (gonguDAO == null) {
			gonguDAO = new GonguDAO();
		}
		return gonguDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertGongu(Gongu gongu) {
		int insertCount = 0;
		PreparedStatement pstmt = null;
		
		try {
			 
			String sql = "insert into gongu (category_name, seller_id, gongu_name, gongu_price,"
					+ "gongu_discount_price, gongu_date,gongu_view_count,gongu_status,gongu_startdate,"
					+ "gongu_findate, gongu_stock, gongu_reserve, gongu_min, gongu_caldate,detail_img,thumbnail_img"
					+ ") values(?,?,?,?,?,now(),?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);			
			
	
			pstmt.setString(1,gongu.getCategory()); 
			pstmt.setString(2,gongu.getSeller_id());
			pstmt.setString(3,gongu.getGongu_name());
			pstmt.setString(4,gongu.getGongu_price());
			pstmt.setString(5,gongu.getGongu_discount_price());
			
			pstmt.setInt(6,0);
			pstmt.setString(7,"0");
			pstmt.setString(8,gongu.getGongu_startdate());
			pstmt.setString(9,gongu.getGongu_findate());
			pstmt.setString(10,gongu.getGongu_stock());
			pstmt.setString(11,gongu.getGongu_reserve());
			pstmt.setString(12,gongu.getGongu_min());
			pstmt.setString(13,gongu.getGongu_caldate());
			pstmt.setString(14,gongu.getDetail_img());
			pstmt.setString(15,gongu.getThumbnail_img());
			
			System.out.println("pstmt:"+pstmt);
			
			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return insertCount;

	}

	public Gongu selectgongu(int id) {
		Gongu gongu = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement("select * from gongu where gongu_id = ?");
			pstmt.setInt(1, id);
			System.out.println(pstmt);			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				gongu = new Gongu();
				gongu.setGongu_id(Integer.parseInt(rs.getString("gongu_id")));
				gongu.setGongu_price(rs.getString("gongu_price"));
				gongu.setSeller_id(rs.getString("seller_id"));
				gongu.setCategory(rs.getString("category_name"));
				gongu.setGongu_discount_price(rs.getString("gongu_discount_price"));
				gongu.setGongu_startdate(rs.getString("gongu_startdate"));
				gongu.setGongu_caldate(rs.getString("gongu_caldate"));
				gongu.setGongu_view_count(rs.getInt("gongu_view_count"));
				gongu.setThumbnail_img(rs.getString("thumbnail_img"));
				gongu.setDetail_img(rs.getString("detail_img"));
				gongu.setGongu_reserve(rs.getString("gongu_reserve"));
				gongu.setGongu_min(rs.getString("gongu_min"));
				gongu.setGongu_status(rs.getString("gongu_status"));
				
				System.out.println(gongu);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return gongu;

	}
	public ArrayList<Gongu> selectGonguList() {
		ArrayList<Gongu> gonguList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement("select * from gongu");
			rs = pstmt.executeQuery();	
			
			if (rs.next()) {
				gonguList = new ArrayList<Gongu>();
				do {
					gonguList.add(new Gongu(Integer.parseInt(rs.getString("gongu_id")), rs.getString("category_name"),rs.getString("gongu_name"),
							rs.getString("gongu_price"),rs.getString("gongu_discount_price"),rs.getString("gongu_status"),rs.getString("gongu_startdate"),
							rs.getString("gongu_findate"),rs.getString("gongu_reserve"),rs.getString("gongu_min"),rs.getString("thumbnail_img")));
				} while (rs.next());
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return gonguList;
	}
	
	public ArrayList<Gongu> selectGonguList(String loginId) {
		ArrayList<Gongu> gonguList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement("select * from gongu where = ?");
			pstmt.setString(1,loginId);
			rs = pstmt.executeQuery();	
			
			
			if (rs.next()) {
				gonguList = new ArrayList<Gongu>();
				do {
					gonguList.add(new Gongu(Integer.parseInt(rs.getString("gongu_id")), rs.getString("category_name"),rs.getString("gongu_name"),
							rs.getString("gongu_price"),rs.getString("gongu_discount_price"),rs.getString("gongu_status"),rs.getString("gongu_startdate"),
							rs.getString("gongu_findate"),rs.getString("gongu_reserve"),rs.getString("gongu_min"),rs.getString("thumbnail_img")));
				} while (rs.next());
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return gonguList;
	}
	
	public int updateReserveCount(String gongu_id) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = "update gongu set gongu_reserve = gongu_reserve +1 where gongu_id="+gongu_id;
		try {
			pstmt = con.prepareStatement(sql);
			System.out.println("reserve count:"+pstmt);
			updateCount = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
				
		return updateCount;
		
	}

	public int updateReadCount(int gongu_id) {
		PreparedStatement pstmt=null;
		int updateCount=0;
		String sql = "update gongu set gongu_view_count = gongu_view_count +1 where gongu_id="+gongu_id;
		try {
			pstmt = con.prepareStatement(sql);
			System.out.println("조회수 업데이트"+pstmt);
			updateCount = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return updateCount;
	}
	
	public int updateGonguStatus(int gongu_id, String nextStatus) {
		int updateCount = 0;
		PreparedStatement psmt = null;
		String sql = "UPDATE gongu SET gongu_status = ? WHERE gongu_id = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, nextStatus);
			psmt.setInt(2, gongu_id);
			System.out.println(psmt);

			updateCount = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("공구상태업데이트오류:"+e);
			e.printStackTrace();
			
		}finally {
			close(psmt);
		}
		
		return updateCount;
	}

	public ArrayList<String[]> startGongu() {
		ArrayList<String[]> startList = new ArrayList<>();
		
		PreparedStatement psmt = null;
		PreparedStatement psmt2 = null;
		ResultSet rs = null;
		String sql = "UPDATE gongu SET gongu_status = '4' WHERE gongu_status='2' && gongu_startdate = CURDATE()";
		String sql2 = "SELECT gongu_id, gongu_name FROM gongu WHERE gongu_status = '4' && gongu_startdate = CURDATE()";
		
		try {
			psmt = con.prepareStatement(sql);
			System.out.println(con);
			int startCount = psmt.executeUpdate();
			if(startCount>0) {
				psmt2 = con.prepareStatement(sql2);
				rs = psmt2.executeQuery();
				
				if(rs.next()) {
					do {
						String[] temp = {"",""} ;
						temp[0] = rs.getString("gongu_id");
						temp[1] = rs.getString("gongu_name");
						startList.add(temp);
						
					}while(rs.next());
					
				}
				
			}else {
				System.out.println("오늘 게시할 공구가 없습니다.");
			}
			
		}catch(Exception e) {
			System.out.println("공구시작오류:"+e);
			
		}finally {
			close(psmt2);
			close(psmt);
		}
		
		return startList;
	}

	
	
	
	


}
