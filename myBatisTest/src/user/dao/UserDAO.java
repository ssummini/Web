package user.dao;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.List;
import java.util.Map;
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

	public List<UserDTO> search(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		List<UserDTO> list = sqlSession.selectList("userSQL.search", map);
		sqlSession.close();
		return list;
	}
}
