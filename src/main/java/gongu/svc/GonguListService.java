package gongu.svc;
import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.GonguDAO;
import vo.Gongu;

public class GonguListService {
	//매개값없이(필터,권한) 모든 공구 리스트 가져오기
	public ArrayList<Gongu> getGonguList() {
		ArrayList<Gongu> gonguList = null;
		//connection 객체
		Connection con = null;
		try {
			con = getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			gonguList = gonguDAO.selectGonguList();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return gonguList;
	}
	
	public int getListCount(String loginId, int loginAuthor, String sOption, String sKeyword,
			ArrayList<String> filterList) {
		
		int listCount = 0;
		
		Connection con = null;
		
		try {
			con = getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			listCount = gonguDAO.selectListCount(loginId,loginAuthor,sOption,sKeyword,filterList);
			
		}catch(Exception e) {
			System.out.println("공구갯수조회오류:"+e);
			
		}finally {
			close(con);
		}
	
		
		return listCount;
	}
	

	public ArrayList<Gongu> getGonguList(int page, int limit, String loginId, int loginAuthor, String sOption,
			String sKeyword, ArrayList<String> filterList) {
		
		ArrayList<Gongu> gonguList = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			gonguList = gonguDAO.selectGonguList(page, limit, loginId, loginAuthor, sOption, sKeyword, filterList);
			
		}catch(Exception e) {
			System.out.println("공구목록조회오류:"+e);
			
		}finally {
			close(con);
		}
		
		
		return gonguList;
	}

	public int gonguStandByCnt(String loginId, int loginAuthor) {
		int standByCount = 0;
		
		Connection con = null;
		
		try {
			con = getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			standByCount = gonguDAO.selectStandByCnt(loginId, loginAuthor);
			
		}catch(Exception e) {
			
		}finally {
			close(con);
		}
	
		
		return standByCount;
	}

	public int gonguOngoindCnt(String loginId, int loginAuthor) {
		int onGoingCount = 0;
		
		Connection con = null;
		
		try {
			con = getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			onGoingCount = gonguDAO.selectOnGoingCount(loginId, loginAuthor);
			
		}catch(Exception e) {
			
		}finally {
			close(con);
		}
	
		
		return onGoingCount;
	}

	public int gonguCalcCnt(String loginId, int loginAuthor) {
		int calcCount = 0;
		
		Connection con = null;
		
		try {
			con = getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			calcCount = gonguDAO.selectCalcCount(loginId, loginAuthor);
			
		}catch(Exception e) {
			
		}finally {
			close(con);
		}
	
		
		return calcCount;
	}

	
	
	/*
	
	//관리자 : 조건필터링으로 공구 리스트 가져오기
	public ArrayList<Gongu> getGonguList(ArrayList<String> filterList) {
		ArrayList<Gongu> gonguList = null;
		//connection 객체
		Connection con = null;
		try {
			con = getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			gonguList = gonguDAO.selectGonguList(filterList);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return gonguList;
	}
	
	//판매자 : 필터링조건,판매자아이디 매개값으로 공구리스트 가져오기
	public ArrayList<Gongu> getGonguList(String loginId, ArrayList<String> filterList) {
		ArrayList<Gongu> gonguList = null;
		
		Connection con = null;
		
		try {
			con = getConnection();
			GonguDAO gonguDAO = GonguDAO.getInstance();
			gonguDAO.setConnection(con);
			
			gonguList = gonguDAO.selectGonguList(loginId,filterList);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			close(con);
		}
		
		return gonguList;
	}
	
	*/

}
