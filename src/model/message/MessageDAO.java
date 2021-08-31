package model.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JDBC;
import oracle.jdbc.proxy.annotation.Pre;

public class MessageDAO {
	public ArrayList<MessageVO> getDBList(){
		Connection conn= JDBC.connect();
		String sql = "select * from message";
		ArrayList<MessageVO> datas= new ArrayList<MessageVO>();
		PreparedStatement pstmt=null;
		try {
			pstmt= conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MessageVO vo=new MessageVO();
				vo.setContent(rs.getString("content"));
				vo.setMnum(rs.getInt("mnum"));
				vo.setTitle(rs.getString("title"));
				vo.setWdate(rs.getDate("wdate"));
				vo.setWriter(rs.getString("writer"));
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
	
	public MessageVO getDBDate(MessageVO vo) {
		
		Connection conn = JDBC.connect();
		PreparedStatement pstmt =null;
		MessageVO data = new MessageVO();
		try {
			String sql="select * from message where mnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMnum());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data.setContent(rs.getString("content"));
				data.setMnum(rs.getInt("mnum"));
				data.setTitle(rs.getString("title"));
				data.setWdate(rs.getDate("wdate"));
				data.setWriter(rs.getString("writer"));
				
			}
			rs.close();
			
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBC.disconnect(pstmt, conn);
		}
		return data;
		
		
		
	}
	public boolean insertDB(MessageVO vo) {
		Connection conn= JDBC.connect();
		PreparedStatement pstmt=null;
		boolean result = false;
		try {
			String sql="insert into message values((select nvl(max(mnum),0)+1 from message),?,?,?,sysdate )";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
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
	public boolean deleteDB(MessageVO vo) {
		Connection conn= JDBC.connect();
		PreparedStatement pstmt = null;
		boolean result= false;
		
		try {
			String sql= "delete from message where mnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMnum());
			pstmt.executeUpdate();
			result= true;
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertDB() 에서 생긴 오류 ");
		}finally {
			JDBC.disconnect(pstmt, conn);
			
		}
		return result;
		
		
		
		
		
	}
	public boolean updateDB(MessageVO vo) {
		
		Connection conn= JDBC.connect();
		boolean result =false;
		PreparedStatement pstmt=null;
		try {
			String sql="update message set writer=?,title=?,content=?,wdate=sysdate where mnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4, vo.getMnum());
			pstmt.executeUpdate();
			
			result=true;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("updateDB() 에서 나온 오류");
		}finally {
			JDBC.disconnect(pstmt, conn);
		}
		
		
		
		return result;
		
	}

}
