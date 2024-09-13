package user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchService implements UserService{
	@Override
	public void execute() {
		System.out.println();
		Scanner scan = new Scanner(System.in);

		System.out.println("1. 이름으로 검색");
		System.out.println("2. 아이디로 검색");
		System.out.print("번호 선택 : ");
		int num = scan.nextInt();	
		
		String columnName = null;
		String value = null;
		if(num == 1) {
			System.out.print("검색을 원하는 이름 입력 : ");
			value = scan.next();
			
			columnName = "name";
		}else if(num == 2) {
			System.out.print("검색을 원하는 아이디 입력 : ");
			value = scan.next();
			
			columnName = "id";
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("columnName", columnName);
		map.put("value", value);
		
		//DB
		UserDAO userDAO = UserDAO.getInstance();
		List<UserDTO> list = userDAO.search(map);

		for (UserDTO userDTO : list) {
            System.out.println(userDTO.getName() + "\t"
            				+ userDTO.getId() + "\t" 
            				+ userDTO.getPwd());
        }
		
	}
}
