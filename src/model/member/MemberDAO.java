package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JDBC;
import oracle.jdbc.proxy.annotation.Pre;

public class MemberDAO {
	public ArrayList<MemberVO> getDBList(){
		Connection conn= JDBC.connect();
		String sql = "select * from member";
		ArrayList<MemberVO> datas= new ArrayList<MemberVO>();
		PreparedStatement pstmt=null;
		try {
			pstmt= conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO vo=new MemberVO();
				vo.setMnum(rs.getInt("mnum"));
				vo.setMid(rs.getString("mid"));
				vo.setMpw(rs.getString("mpw"));
				
		
				datas.add(vo);
				

			}
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBC.disconnect(pstmt, conn);
		}

		return datas;
	}
	
	public MemberVO getDBDate(MemberVO vo) {
		
		Connection conn = JDBC.connect();
		PreparedStatement pstmt =null;
		MemberVO data = null;
		try {
			String sql="select * from member where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new MemberVO();
				data.setMid(rs.getString("mid"));
				data.setMpw(rs.getString("mpw"));
				data.setMnum(rs.getInt("mnum"));
				
			}
			rs.close();
			
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBC.disconnect(pstmt, conn);
		}
		return data;
		
		
		
	}
public MemberVO getDBDate2(MemberVO vo) {
		
		Connection conn = JDBC.connect();
		PreparedStatement pstmt =null;
		MemberVO data = null;
		try {
			String sql="select * from member where mid=? and mpw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new MemberVO();
				data.setMid(rs.getString("mid"));
				data.setMpw(rs.getString("mpw"));
				data.setMnum(rs.getInt("mnum"));
				
			}
			rs.close();
			
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBC.disconnect(pstmt, conn);
		}
		return data;
		
		
		
	}
	public boolean insertDB(MemberVO vo) {
		Connection conn= JDBC.connect();
		PreparedStatement pstmt=null;
		boolean result = false;
		try {
			String sql="insert into member values((select nvl(max(mnum),0)+1 from member),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			
			pstmt.executeUpdate();
			result= true;
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("insert()에서 에러 발생");
			
		}finally 
		{
			JDBC.disconnect(pstmt, conn);
		}
		return result;
	}
	

}
