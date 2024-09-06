package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardDTO;


public class BoardDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;
	
	private static BoardDAO boardDAO = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return boardDAO;
	}
	
	public BoardDAO() {
		// 실행하자마자 커넥션 받아야한다.
		Context ctx;
		try {
			ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle"); //Tomcat의 경우 - java:comp/env/
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void boardWrite(BoardDTO boardDTO) {
	    String sql = "insert into board values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";

	    try {
	        con = ds.getConnection();
	        
	        // 시퀀스 값 가져오기
	        String seqSql = "select seq_board.NEXTVAL from dual";
	        pstmt = con.prepareStatement(seqSql);
	        rs = pstmt.executeQuery();
	        
	        int seqValue = 0;
	        if (rs.next()) {
	            seqValue = rs.getInt(1);
	        }

	        // SQL 준비
	        pstmt = con.prepareStatement(sql);

	        // ? 데이터 매핑
	        pstmt.setInt(1, seqValue);
	        pstmt.setString(2, boardDTO.getId());
	        pstmt.setString(3, boardDTO.getName());
	        pstmt.setString(4, boardDTO.getEmail());
	        pstmt.setString(5, boardDTO.getSubject());
	        pstmt.setString(6, boardDTO.getContent());
	        pstmt.setInt(7, seqValue);  // ref에 시퀀스 값 사용

	        // lev, step, pseq 값이 0인 경우 기본값 0으로 설정
	        pstmt.setInt(8, boardDTO.getLev() != 0 ? boardDTO.getLev() : 0);
	        pstmt.setInt(9, boardDTO.getStep() != 0 ? boardDTO.getStep() : 0);
	        pstmt.setInt(10, boardDTO.getPseq() != 0 ? boardDTO.getPseq() : 0);

	        pstmt.setInt(11, boardDTO.getReply() != 0 ? boardDTO.getReply() : 0);
	        pstmt.setInt(12, boardDTO.getHit() != 0 ? boardDTO.getHit() : 0);

	        pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (pstmt != null) pstmt.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}
	
	public List<BoardDTO> boardList(){
		List<BoardDTO> boardList = new ArrayList<>();
		String sql = "select * from board order by seq desc";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO boardDTO = new BoardDTO();				
				boardDTO.setSeq(rs.getInt("seq"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setLogtime(rs.getDate("logtime")); 
				boardDTO.setHit(rs.getInt("hit"));
				boardList.add(boardDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}
}
	
