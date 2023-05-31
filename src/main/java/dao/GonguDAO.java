package dao;
import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

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
				gongu.setGongu_name(rs.getString("gongu_name"));
				gongu.setCategory(rs.getString("category_name"));
				gongu.setGongu_discount_price(rs.getString("gongu_discount_price"));
				gongu.setGongu_date(rs.getString("gongu_date"));
				gongu.setGongu_startdate(rs.getString("gongu_startdate"));
				gongu.setGongu_findate(rs.getString("gongu_findate"));
				gongu.setGongu_caldate(rs.getString("gongu_caldate"));
				gongu.setGongu_view_count(rs.getInt("gongu_view_count"));
				gongu.setThumbnail_img(rs.getString("thumbnail_img"));
				gongu.setDetail_img(rs.getString("detail_img"));
				gongu.setGongu_stock(rs.getString("gongu_stock"));
				gongu.setGongu_reserve(rs.getString("gongu_reserve"));
				gongu.setGongu_min(rs.getString("gongu_min"));
				gongu.setGongu_status(rs.getString("gongu_status"));
				gongu.setGongu_disabled_date(rs.getDate("gongu_disabled_date"));
				gongu.setGongu_disabled_text(rs.getString("gongu_disabled_text"));
				
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
			pstmt = con.prepareStatement("select * from gongu where gongu_status in ('4','5')");
			rs = pstmt.executeQuery();	
			
			if (rs.next()) {
				gonguList = new ArrayList<Gongu>();
				do {
					gonguList.add(new Gongu(Integer.parseInt(rs.getString("gongu_id")),rs.getString("category_name"),rs.getString("seller_id"),rs.getString("gongu_name"),
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
		ArrayList<Gongu> gonguList = new ArrayList<Gongu>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement("select * from gongu where seller_id= ?");
			pstmt.setString(1,loginId);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();	

			if (rs.next()) {
				do {
					Gongu gongu = new Gongu(Integer.parseInt(rs.getString("gongu_id")),
											rs.getString("category_name"),
											rs.getString("gongu_name"),
											rs.getString("gongu_price"),
											rs.getString("gongu_discount_price"),
											rs.getString("gongu_status"),
											rs.getString("gongu_startdate"),
											rs.getString("gongu_findate"),
											rs.getString("gongu_reserve"),
											rs.getString("gongu_min"),
											rs.getString("thumbnail_img"));
					gongu.setSeller_id(rs.getString("seller_id"));
					gonguList.add(gongu);
					
				} while (rs.next());
			}			
			
		} catch (Exception e) {
			System.out.println("공구목록선택오류:"+e);
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
	
	//비활성화 대기로 변경
	public int updateGonguStatus(int gongu_id, String nextStatus, String d_date, String d_text) {
		int updateCount = 0;
		PreparedStatement psmt = null;
		String sql = "UPDATE gongu SET gongu_status = ?, gongu_disabled_date = ?, gongu_disabled_text = ? WHERE gongu_id = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, nextStatus);
			psmt.setString(2, d_date);
			psmt.setString(3, d_text);
			psmt.setInt(4, gongu_id);
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
	

	public ArrayList<Gongu> startGongu() {
		ArrayList<Gongu> startList = new ArrayList<>();
		
		PreparedStatement psmt = null;
		PreparedStatement psmt2 = null;
		ResultSet rs = null;
		String sql = "SELECT gongu_id, gongu_name FROM gongu WHERE gongu_status = '2' AND gongu_startdate <= CURDATE()";
		String sql2 = "UPDATE gongu SET gongu_status = '4' WHERE gongu_id IN (SELECT gongu_id FROM("+sql+") AS tmp_table)";

		try {
			psmt = con.prepareStatement(sql);
			System.out.println(psmt);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				do {
					Gongu gongu = new Gongu();
					gongu.setGongu_id(rs.getInt("gongu_id"));
					gongu.setGongu_name(rs.getString("gongu_name"));
					
					startList.add(gongu);
					
				}while(rs.next());
				
				psmt2 = con.prepareStatement(sql2);
				psmt2.executeUpdate();
				
			}
			
		}catch(Exception e) {
			System.out.println("공구시작오류:"+e);
			
		}finally {
			close(psmt2);
			close(rs);
			close(psmt);
		}
		
		return startList;
	}

	public int updateGongu(Gongu gongu) {
		int resultCount = 0;
		PreparedStatement psmt = null;
		String sql = "UPDATE gongu SET category_name=?, gongu_name=?, gongu_price=?, "
				+ "gongu_discount_price=?, gongu_date=now(), gongu_startdate=?, gongu_findate=?, gongu_stock=?, gongu_min=?, "
				+ "gongu_caldate=?";
		
		if(gongu.detail_img != null) {
			sql+=", detail_img='"+gongu.detail_img+"'";
		}
		if(gongu.thumbnail_img != null) {
			sql+=", thumbnail_img='"+gongu.thumbnail_img+"'";
		}	
		sql+=" WHERE gongu_id="+gongu.getGongu_id();
		
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, gongu.getCategory());
			psmt.setString(2, gongu.getGongu_name());
			psmt.setString(3, gongu.getGongu_price());
			psmt.setString(4, gongu.getGongu_discount_price());
			psmt.setString(5, gongu.getGongu_startdate());
			psmt.setString(6, gongu.getGongu_findate());
			psmt.setString(7, gongu.getGongu_stock());
			psmt.setString(8, gongu.getGongu_min());
			psmt.setString(9, gongu.getGongu_caldate());
			
			System.out.println(psmt);
			
			resultCount = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("공구업데이트오류:"+e);
			
		}finally {
			close(psmt);
		}

		return resultCount;
	}

	public ArrayList<Gongu> getPopularList() {
		ArrayList<Gongu> popularList = new ArrayList<Gongu>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement("select * from gongu where gongu_status = '4' order by gongu_reserve desc limit 4");
			System.out.println(pstmt);
			rs = pstmt.executeQuery();	
			
			if (rs.next()) {
				do {
					popularList.add(new Gongu(Integer.parseInt(rs.getString("gongu_id")),rs.getString("category_name"),rs.getString("seller_id"),rs.getString("gongu_name"),
							rs.getString("gongu_price"),rs.getString("gongu_discount_price"),rs.getString("gongu_status"),rs.getString("gongu_startdate"),
							rs.getString("gongu_findate"),rs.getString("gongu_reserve"),rs.getString("gongu_min"),rs.getString("thumbnail_img")));
				} while (rs.next());
			}	
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return popularList;
	}

	
	public ArrayList<Gongu> getNewList() {
		ArrayList<Gongu> newList = new ArrayList<Gongu>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement("select * from gongu where gongu_status = '4' order by gongu_startdate desc limit 4");
			
			rs = pstmt.executeQuery();	
			
			if (rs.next()) {
				do {
					newList.add(new Gongu(Integer.parseInt(rs.getString("gongu_id")),rs.getString("category_name"),rs.getString("seller_id"),rs.getString("gongu_name"),
							rs.getString("gongu_price"),rs.getString("gongu_discount_price"),rs.getString("gongu_status"),rs.getString("gongu_startdate"),
							rs.getString("gongu_findate"),rs.getString("gongu_reserve"),rs.getString("gongu_min"),rs.getString("thumbnail_img")));
				} while (rs.next());
			}	
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return newList;
	}

	public ArrayList<Gongu> getOldList() {
		ArrayList<Gongu> oldList = new ArrayList<Gongu>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement("select * from gongu where gongu_status = '4' order by gongu_startdate asc limit 4;");
			
			rs = pstmt.executeQuery();	
			
			if (rs.next()) {
				do {
					oldList.add(new Gongu(Integer.parseInt(rs.getString("gongu_id")),rs.getString("category_name"),rs.getString("seller_id"),rs.getString("gongu_name"),
							rs.getString("gongu_price"),rs.getString("gongu_discount_price"),rs.getString("gongu_status"),rs.getString("gongu_startdate"),
							rs.getString("gongu_findate"),rs.getString("gongu_reserve"),rs.getString("gongu_min"),rs.getString("thumbnail_img")));
				} while (rs.next());
			}	
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return oldList;
	}
	
	
	public ArrayList<Gongu> closeGongu() {
		ArrayList<Gongu> closeList = new ArrayList<>();
		
		PreparedStatement psmt = null;
		PreparedStatement psmt2 = null;
		ResultSet rs = null;
		
		String sql = "SELECT gongu_id, gongu_name, gongu_status, gongu_reserve, gongu_min, gongu_findate FROM gongu WHERE gongu_status = '4' AND (gongu_findate <= CURDATE() OR gongu_reserve >= gongu_stock)";
		String sql2 = "UPDATE gongu SET gongu_status = IF(gongu_reserve < gongu_min, '7', '8'), gongu_update = CURDATE() WHERE gongu_id IN (SELECT gongu_id FROM ("
				+sql+") AS tmp_table)";
		
		//String sql = "UPDATE gongu SET gongu_status = IF(gongu_reserve < gongu_min, '7', '8'), gongu_update=CURDATE() WHERE gongu_status = '4' && (gongu_findate <= CURDATE() || gongu_reserve >= gongu_stock)";
		//String sql2 = "SELECT gongu_id, gongu_name, gongu_status FROM gongu WHERE (gongu_status = '7' || gongu_status = '8') && gongu_update = CURDATE()";
		
		try {
			psmt = con.prepareStatement(sql);
			System.out.println(psmt);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				do {
					Gongu gongu = new Gongu();
					gongu.setGongu_id(rs.getInt("gongu_id"));
					gongu.setGongu_name(rs.getString("gongu_name"));
					gongu.setGongu_status(rs.getString("gongu_status"));
					
					closeList.add(gongu);
					
				}while(rs.next());
				
				//System.out.println("선택된공구수:"+closeList.size());
				
				psmt2 = con.prepareStatement(sql2);
				System.out.println(psmt2);
				psmt2.executeUpdate();
			}
			
//			System.out.println(psmt);
//			int closeCount = psmt.executeUpdate();
//			
//			System.out.println("closeCount:"+closeCount);
//			
//			if(closeCount > 0) {
//				psmt2 = con.prepareStatement(sql2);
//				System.out.println(psmt2);
//				rs = psmt2.executeQuery();
//				
//				if(rs.next()) {
//					do {
//						Gongu gongu = new Gongu();
//						gongu.setGongu_id(rs.getInt("gongu_id"));
//						gongu.setGongu_name(rs.getString("gongu_name"));
//						gongu.setGongu_status(rs.getString("gongu_status"));
//						
//						closeList.add(gongu);
//						
//					}while(rs.next());
//				}
//					
//			}	//System.out.println("종료된공구:"+closeList.size());
					
		}catch(Exception e) {
			System.out.println("공구종료오류:"+e);
			
		}finally {
			close(psmt2);
			close(rs);
			close(psmt);
		}
		
		return closeList;
	}



	public ArrayList<Gongu> getCategoryList(String category) {
		ArrayList<Gongu> categoryList = new ArrayList<Gongu>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement("select * from gongu where gongu_status = '4' and category_name = '"+category+"'");
			System.out.println("카테고리리스트:"+pstmt);			
			rs = pstmt.executeQuery();	
			
			if (rs.next()) {
				do {
					categoryList.add(new Gongu(Integer.parseInt(rs.getString("gongu_id")),rs.getString("category_name"),rs.getString("seller_id"),rs.getString("gongu_name"),
							rs.getString("gongu_price"),rs.getString("gongu_discount_price"),rs.getString("gongu_status"),rs.getString("gongu_startdate"),
							rs.getString("gongu_findate"),rs.getString("gongu_reserve"),rs.getString("gongu_min"),rs.getString("thumbnail_img")));
				} while (rs.next());
			}	
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		
		return categoryList;
	}

	public ArrayList<Gongu> getMenuList(String menu) {
	      ArrayList<Gongu> menuList = new ArrayList<Gongu>();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         if(menu.equals("gongu_findate")) {   
	         pstmt = con.prepareStatement("select * from gongu where gongu_status = '4' order by "+menu+" asc");   
	         }else {
	         pstmt = con.prepareStatement("select * from gongu where gongu_status = '4' order by "+menu+" desc");
	         }
	         System.out.println("메뉴리스트:"+pstmt);         
	         rs = pstmt.executeQuery();   
	         
	         if (rs.next()) {
	            do {
	               menuList.add(new Gongu(Integer.parseInt(rs.getString("gongu_id")),rs.getString("category_name"),rs.getString("seller_id"),rs.getString("gongu_name"),
	                     rs.getString("gongu_price"),rs.getString("gongu_discount_price"),rs.getString("gongu_status"),rs.getString("gongu_startdate"),
	                     rs.getString("gongu_findate"),rs.getString("gongu_reserve"),rs.getString("gongu_min"),rs.getString("thumbnail_img")));
	            } while (rs.next());
	         }   
	         
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	         close(rs);
	         close(pstmt);
	      }
	      
	      
	      
	      return menuList;
	   }
	public ArrayList<Gongu> getSearchList(String search) {
		ArrayList<Gongu> searchList = new ArrayList<Gongu>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt=con.prepareStatement("select * from gongu where gongu_name like '%"+search+"%' and gongu_status='4'");
			System.out.println(pstmt);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				do {
					searchList.add(new Gongu(Integer.parseInt(rs.getString("gongu_id")),rs.getString("category_name"),rs.getString("seller_id"),rs.getString("gongu_name"),
							rs.getString("gongu_price"),rs.getString("gongu_discount_price"),rs.getString("gongu_status"),rs.getString("gongu_startdate"),
							rs.getString("gongu_findate"),rs.getString("gongu_reserve"),rs.getString("gongu_min"),rs.getString("thumbnail_img")));
				} while (rs.next());
			}
		}catch(Exception e) {
			
		}finally {
			close(rs);
			close(pstmt);
		}
	
		return searchList;
	}

	public int selectListCount(String loginId, int loginAuthor, String sOption, String sKeyword, ArrayList<String>filterList) {
		int listCount = 0;
		PreparedStatement psmt =  null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM gongu"; //시스템 - 검색조건 없음

		//조건1. 필터(필수로 들어감)
		if(filterList.size() >= 1 && !(filterList.get(0).equals("all"))) {//선택된 공구조건이 1개 이상이고 그 하나가 all(전체)이 아닐때만 실행  
			sql += " WHERE gongu_status IN(";
			for(int i=0; i<filterList.size(); i++) {
				sql += "'"+filterList.get(i)+"'";
				if(i<filterList.size()-1) {
					sql += ",";
				}
				if(filterList.get(i).equals("5")) {
					sql += ",'6'";
				}
			}
			sql += ")";
			
		}else {//공구조건이 all일때만 실행 -> all이면 조건 안붙여도 되는데 하는 이유 : 조건절 시작을 위해 WHERE 붙여야되서
			sql += " WHERE gongu_status >= 0"; 
		}
		
		//조건2. 판매자 or 관리자 (판매자면 seller_id = loginId 조건)
		if(loginAuthor > 0) {
			sql += " AND seller_id='"+loginId+"'";
		}
		//조건3. 검색조건 유무
		if(sOption != null && sKeyword != null) {
			sql += " AND "+ sOption + " LIKE '%"+sKeyword+"%'";
					
		}

		try {
			psmt = con.prepareStatement(sql);
			System.out.println("공구개수선택쿼리"+psmt);
			rs = psmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1); //첫번째 컬럼값(count 함수 결과) 가져오기
			}
			
		}catch(Exception e) {
			System.out.println("공구갯수선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		
		return listCount;
	}

	public int selectStandByCnt(String loginId, int loginAuthor) {
		int count = 0;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM gongu WHERE gongu_status = 0";
		
		//조건:판매자 권한이면 seller_id 조건 추가
		if(loginAuthor>0) {
			sql += " AND seller_id = '"+loginId+"'";
		}
		
		try {
			psmt = con.prepareStatement(sql);
			System.out.println(psmt);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch(Exception e) {
			System.out.println("승인대기공구선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		return count;
	}

	public int selectOnGoingCount(String loginId, int loginAuthor) {
		int count = 0;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM gongu WHERE gongu_status = 4";
		
		//조건:판매자 권한이면 seller_id 조건 추가
		if(loginAuthor>0) {
			sql += " AND seller_id = '"+loginId+"'";
		}
		
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch(Exception e) {
			System.out.println("진행중공구선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		return count;
	}

	public int selectCalcCount(String loginId, int loginAuthor) {
		int count = 0;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM gongu WHERE gongu_status = 8";
		
		//조건:판매자 권한이면 seller_id 조건 추가
		if(loginAuthor>0) {
			sql += " AND seller_id = '"+loginId+"'";
		}
		
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch(Exception e) {
			System.out.println("정산중공구선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}
		
		return count;
	}

	public ArrayList<Gongu> selectGonguList(int page, int limit, String loginId, int loginAuthor, String sOption,
			String sKeyword, ArrayList<String> filterList) {
		
		ArrayList<Gongu> gonguList = new ArrayList<>();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM gongu";
		
		int startRow = (page-1)*limit; //시작행
		
		//조건1. 필터(필수로 들어감)
		if(filterList.size() >= 1 && !(filterList.get(0).equals("all"))) {//선택된 공구조건이 1개 이상이고 그 하나가 all(전체)이 아닐때만 실행  
			sql += " WHERE gongu_status IN(";
			for(int i=0; i<filterList.size(); i++) {
				sql += "'"+filterList.get(i)+"'";
				if(i<filterList.size()-1) {
					sql += ",";
				}
				if(filterList.get(i).equals("5")) {
					sql += ",'6'";
				}
			}
			sql += ")";
			
		}else {//공구조건이 all일때만 실행 -> all이면 조건 안붙여도 되는데 하는 이유 : 조건절 시작을 위해 WHERE 붙여야되서
			sql += " WHERE gongu_status >= 0"; 
		}
		
		//조건2. 판매자 or 관리자 (판매자면 seller_id = loginId 조건)
		if(loginAuthor > 0) {
			sql += " AND seller_id='"+loginId+"'";
		}
		//조건3. 검색조건 유무
		if(sOption != null && sKeyword != null) {
			sql += " AND "+ sOption + " LIKE '%"+sKeyword+"%'";
					
		}
		
		sql+=" ORDER BY FIELD(gongu_status, 0) DESC, gongu_date DESC limit ?, ?"; //승인대기중인 공구만 항상 상단에 위치, 그 외에는 등록일 기준 내림차순

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, startRow);
			psmt.setInt(2, limit);
			System.out.println("공구목록선택쿼리:"+psmt);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				do {
					Gongu gongu = new Gongu();
					gongu.setGongu_id(rs.getInt("gongu_id")); //공구id
					gongu.setGongu_status(rs.getString("gongu_status")); //공구상태
					gongu.setGongu_name(rs.getString("gongu_name")); //공구명
					gongu.setGongu_startdate(rs.getString("gongu_startdate"));//공구시작일
					gongu.setGongu_findate(rs.getString("gongu_findate"));//공구마감일
					gongu.setSeller_id(rs.getString("seller_id"));//판매자
					gongu.setGongu_date(rs.getString("gongu_date"));//등록일
					
					gonguList.add(gongu);
					
				}while(rs.next());
			}
			
		}catch(Exception e) {
			System.out.println("공구목록선택오류:"+e);
			
		}finally {
			close(rs);
			close(psmt);
		}

		return gonguList;
	}

	
	//메인 마감임박공구
		public ArrayList<Gongu> seletClosingGonguList() {
			ArrayList<Gongu> gonguList = new ArrayList<>();
			PreparedStatement psmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM gongu WHERE gongu_findate BETWEEN CURDATE() AND (SELECT DATE_ADD(CURDATE(), INTERVAL 3 DAY)) ORDER BY gongu_findate limit 10";
			
			try {
				psmt = con.prepareStatement(sql);
				rs = psmt.executeQuery();
				System.out.println(psmt);
				
				if(rs.next()) {
					do {
						Gongu gongu = new Gongu();
						gongu.setGongu_name(rs.getString("gongu_name"));//공구명
						gongu.setGongu_findate(rs.getString("gongu_findate"));//판매마감일
						
						gonguList.add(gongu);
					
					}while(rs.next());
				}
				
			}catch(Exception e) {
				System.out.println("마감임박공구선택오류:"+e);
				
			}finally {
				close(rs);
				close(psmt);
			}
			
			return gonguList;
		}
		
		//메인 판매자 진행중 공구
		public ArrayList<Gongu> selectOnGoingList(String loginId) {
			ArrayList<Gongu> gonguList = new ArrayList<>();
			PreparedStatement psmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM gongu WHERE seller_id = ? AND gongu_status = '4' ORDER BY gongu_date DESC limit 10";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1,loginId);
				System.out.println(psmt);
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					do {
						Gongu gongu = new Gongu();
						gongu.setGongu_name(rs.getString("gongu_name"));//공구명
						gongu.setGongu_startdate(rs.getString("gongu_startdate"));//공구시작일
						gongu.setGongu_findate(rs.getString("gongu_findate"));//공구종료일
						gongu.setGongu_reserve(rs.getString("gongu_reserve"));//공구구매수
						
						gonguList.add(gongu);
						
					}while(rs.next());
				}
				
			}catch(Exception e) {
				System.out.println("판매자진행중공구목록선택오류:"+e);
				
			}finally {
				close(rs);
				close(psmt);
			}
			
			return gonguList;
		}
		
		//판매자가 승인대기일때 공구 삭제
		public int deleteGongu(String gongu_id) {
			int result = 0;
			PreparedStatement psmt = null;
			String sql = "DELETE FROM gongu WHERE gongu_id = ? AND gongu_status = '0'";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, gongu_id);
				System.out.println(psmt);
				result = psmt.executeUpdate();
				
			}catch(Exception e) {
				System.out.println("판매자공구삭제실패:"+e);
				
			}finally {
				close(psmt);
			}
			
			return result;
		}

		public HashMap<Integer, String> selectMemberGongu(String member_id) {
			HashMap<Integer, String> gonguList = new HashMap<Integer, String>();
			PreparedStatement psmt = null;
			ResultSet rs = null;
			String sql = "SELECT DISTINCT(g.gongu_id), g.gongu_name "
					+ "FROM orders o JOIN member m ON o.member_id = m.member_id "
					+ "JOIN gongu g ON o.gongu_id = g.gongu_id WHERE o.member_id = ?";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, member_id);
				System.out.println(psmt);
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					do {
						gonguList.put(rs.getInt(1), rs.getString(2));
						
					}while(rs.next());
				}
				
			}catch(Exception e) {
				
			}finally {
				close(rs);
				close(psmt);
			}
			
			return gonguList;
		}


		public boolean heartChk(String member_id, int id) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			boolean heartChk = false;
			String sql = "select * from heart where gongu_id = ? and member_id = ?";
			try {
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, id);
				pstmt.setString(2, member_id);
				
				System.out.println(pstmt);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					heartChk = true;
				}
				
			}catch(Exception e) {
				
			}finally {
				
			}
			
			return heartChk;
			
		}	

		public ArrayList<Gongu> getHeartList(String member_id) {
			ArrayList<Gongu> heartList = new ArrayList<Gongu>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				pstmt = con.prepareStatement("select * from gongu where gongu_id in (select gongu_id from heart where member_id = '"+member_id+"')");
				System.out.println(pstmt);
				rs = pstmt.executeQuery();	
				
				if (rs.next()) {
					do {
						heartList.add(new Gongu(Integer.parseInt(rs.getString("gongu_id")),rs.getString("category_name"),rs.getString("seller_id"),rs.getString("gongu_name"),
								rs.getString("gongu_price"),rs.getString("gongu_discount_price"),rs.getString("gongu_status"),rs.getString("gongu_startdate"),
								rs.getString("gongu_findate"),rs.getString("gongu_reserve"),rs.getString("gongu_min"),rs.getString("thumbnail_img")));
					} while (rs.next());
				}	
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			
			
			
			return heartList;

		}

		




	
	


}
