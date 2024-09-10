package user.service;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserUpdateService implements UserService{
	@Override
	public void execute() {
		System.out.println();
		Scanner scan = new Scanner(System.in);
		UserDAO userDAO = UserDAO.getInstance();
		
		System.out.print("수정할 아이디 입력: ");
		String id = scan.next();
		UserDTO userDTO = userDAO.getUser(id);
		if(userDTO != null) {
			System.out.println(userDTO.getName() + "\t" 
						     + userDTO.getId() + "\t" 
						     + userDTO.getPwd());
			System.out.println();
			
			System.out.print("수정할 이름 입력: ");
			String name = scan.next();
			System.out.print("수정할 비밀번호 입력: ");
			String pwd = scan.next();
			
			userDTO.setName(name);
			userDTO.setPwd(pwd);
			int su = userDAO.update(userDTO);
			
			//응답
			System.out.println(su + "개의 행이 수정되었습니다.");
		}else {
			System.out.print("수정할 아이디가 없습니다.");
		}
		System.out.println();
		
	}
}
