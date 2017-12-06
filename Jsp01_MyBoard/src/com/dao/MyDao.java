package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dto.MyDto;

public class MyDao {
	
	Connection con = null;
	
	public MyDao() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("01.����̹� ���� ����");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("01.����̹� ���� ����");
		}
	}
	
	public List<MyDto> seleletAll(){
		
		con = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<MyDto> res = new ArrayList<MyDto>();
		
		String sql = "SELECT * FROM MYBOARD ORDER BY SEQ DESC";
		
		try {
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hk","hk");
			System.out.println("02.���� ���� ����");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("02.���� ���� ����");
		}
		
		try {
			System.out.println("03.query�� ���� �غ�");
			stmt = con.createStatement();
			
			System.out.println("04.query�� ������ db�� return : " + sql);
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MyDto tmp = new MyDto();
				tmp.setSeq(rs.getInt(1));
				tmp.setWriter(rs.getString(2));
				tmp.setTitle(rs.getString(3));
				tmp.setContent(rs.getString(4));
				tmp.setRegDate(rs.getDate(5));
				
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 �ܰ� ����");
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				con.close();
				System.out.println("05.db ���� ����\n");
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("05.db ���� ����\n");
			}
			
		}
		
		return res;
	}
	
	public int insert(MyDto dto) {
		con = null;
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "INSERT INTO MYBOARD VALUES(MYBOARDSQ.NEXTVAL,?,?,?,SYSDATE)";
		
		try {
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hk","hk");
			System.out.println("02.���� ���� ����");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("02.���� ���� ����");
		}
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getWriter());
			pstm.setString(2, dto.getTitle());
			pstm.setString(3, dto.getContent());
			System.out.println("03.query�� ���� �غ�");
			
			System.out.println("04.query�� ������ insert : " + sql);
			res = pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("3/4 �ܰ� ����");
		} finally {
			try {
				pstm.close();
				con.close();
				System.out.println("05.db ���� ����\n");
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("05.db ���� ����\n");
			}
		}
		
		return res;
	}
	
	public MyDto selectOne(int seq) {
		con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MyDto res = new MyDto();
		
		String sql = "SELECT * FROM MYBOARD WHERE SEQ = ? ORDER BY SEQ";
		
		try {
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hk","hk");
			System.out.println("02.���� ���� ����");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("02.���� ���� ����");
		}
		
		
		try {
			System.out.println("03.query�� ���� �غ�");
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, seq);
			
			System.out.println("04.query�� ������ db�� return : " + sql);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				res.setSeq(rs.getInt(1));
				res.setWriter(rs.getString(2));
				res.setTitle(rs.getString(3));
				res.setContent(rs.getString(4));
				res.setRegDate(rs.getDate(5));
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			System.out.println("3/4 �ܰ� ����");
			try {
				rs.close();
				pstm.close();
				con.close();
				System.out.println("05.db ���� ����\n");
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("05.db ���� ����\n");
			}
		}
		
		return res;
	}
	
	public boolean update(MyDto dto) {
		con = null;
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "UPDATE MYBOARD SET TITLE=?, CONTENT=?, REGDATE = SYSDATE WHERE SEQ = ?";
		
		try {
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hk","hk");
			System.out.println("02.���� ���� ����");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("02.���� ���� ����");
		}
		
		try {
			pstm = con.prepareStatement(sql);
			
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getSeq());
			
			System.out.println("04.query�� ������ update : " + sql);
			res = pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("3/4�ܰ� ����");
		} finally {
			try {
				pstm.close();
				con.close();
				System.out.println("05.db ���� ����\n");
			} catch (SQLException e) {
				System.out.println("05.db ���� ����\n");
				e.printStackTrace();
			}
			
		}
		
		if(res > 0) {
			return true;
		}else {
			return false;
		}
		
	}
	
	public boolean delete(int seq) {
		con = null;
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "DELETE FROM MYBOARD WHERE SEQ = ?";
		
		try {
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hk","hk");
			System.out.println("02.���� ���� ����");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("02.���� ���� ����");
		}
		
		try {
			System.out.println("03.query�� ���� �غ�");
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, seq);
			
			System.out.println("04.query�� ������ delete : " + sql);
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			System.out.println("3/4�ܰ� ����");
			e.printStackTrace();
		} finally {
			try {
				pstm.close();
				con.close();
			} catch (SQLException e) {
				System.out.println("05.db �������");
				e.printStackTrace();
			}	
		}
		if(res > 0) {
			return true;
		}else {
			return false;
		}
	}
}
	











