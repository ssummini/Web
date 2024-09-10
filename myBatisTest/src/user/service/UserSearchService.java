package user.service;

import java.util.List;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchService implements UserService{
	@Override
	public void execute() {
		System.out.println();
		Scanner scan = new Scanner(System.in);
		int num = 0;

		System.out.println("1. 이름으로 검색");
		System.out.println("2. 아이디로 검색");
		System.out.print("번호 선택 : ");
		num = scan.nextInt();	
		
		UserDAO userDAO = UserDAO.getInstance();
		List<UserDTO> list = userDAO.search(num);

		if(!list.isEmpty()) {
			for (UserDTO userDTO : list) {
	            System.out.println("이름: " + userDTO.getName() 
	            				+ "\t아이디: " + userDTO.getId() 
	            				+ "\t비밀번호: " + userDTO.getPwd());
	        }
		}else {
			System.out.println("검색하신 이름 또는 아이디가 없습니다.");
		}
	}
}
