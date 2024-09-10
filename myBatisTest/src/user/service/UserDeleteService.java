package user.service;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserDeleteService implements UserService{
	@Override
	public void execute() {
		System.out.println();
		Scanner scan = new Scanner(System.in);
		UserDAO userDAO = UserDAO.getInstance();
		
		System.out.print("삭제할 아이디 입력: ");
		String id = scan.next();
		
		UserDTO userDTO = userDAO.getUser(id);
		if(userDTO != null) {
			System.out.println(userDTO.getName() + "\t" 
						     + userDTO.getId() + "\t" 
						     + userDTO.getPwd());
			System.out.println();
			
			System.out.print("삭제할 아이디 입력: ");
			String id2 = scan.next();
			int su = userDAO.delete(id2);
			
			//응답
			System.out.println(su + "개의 행이 삭제되었습니다.");
		}else
			System.out.print("삭제할 아이디가 없습니다.");
		System.out.println();
	}
}
