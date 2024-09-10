package user.dao;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.List;
import java.util.Scanner;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.xml.sax.InputSource;

import user.bean.UserDTO;

public class UserDAO {
	private static UserDAO userDAO = new UserDAO();
	private SqlSessionFactory sqlSessionFactory;
	public static UserDAO getInstance() {
		return userDAO;
	}
	
	public UserDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			
			//InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			//sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int write(UserDTO userDTO) {
		int su = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		su = sqlSession.insert("userSQL.write", userDTO);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}

	public List<UserDTO> getAllList() {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		List<UserDTO> list = sqlSession.selectList("userSQL.getAllList");
		sqlSession.close();
		return list;
	}

	public UserDTO getUser(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		UserDTO userDTO = sqlSession.selectOne("userSQL.getUser", id);
		sqlSession.close();
		return userDTO;
	}


	public int update(UserDTO userDTO) {
		int su = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		su = sqlSession.update("userSQL.update", userDTO);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}

	public int delete(String id) {
		int su = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		su = sqlSession.delete("userSQL.delete", id);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}

	public List<UserDTO> search(int num) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		Scanner scan = new Scanner(System.in);
		String name = null;
		String id = null;
		if(num == 1) {
			System.out.print("검색을 원하는 이름 입력 : ");
			name = scan.next();
		}else if(num == 2) {
			System.out.print("검색을 원하는 아이디 입력 : ");
			id = scan.next();
		}
		
		UserDTO userDTO = new UserDTO();
		userDTO.setName(name);
		userDTO.setId(id);
		List<UserDTO> list = sqlSession.selectList("userSQL.search", userDTO);
		sqlSession.close();
		return list;
	}
}
