$(function(){
	$('#join').submit(function(){
		let user_id = $('input[name="user_id"]').val();
		//id(!user_id){}
		if(user_id == ''){
			alert("아이디를 입력하세요.");
			$('input[name=user_id]').focus();
			return false;
		}
		
		let user_pw = $('input[name="user_pw"]').val();
		if(!user_pw){
			alert("비밀번호를 입력하세요.");
			$('input[name=user_pw]').focus();
			return false;
		}	
		
		if(!$('input[name="gender"]').is(':checked')) {
			alert("성별을 입력하세요.");
			
			//남자 선택하게 하는 것 전부 name속성
			//radio는 배열로 받는다. 남자 : gender[0] / 여자 : gender[1]
			//document.form1.gender[0].checked = true;
			
			$('input[name="gender"]:eq(0)').attr('checked', true)
			return false;
		}
		
		let email = $('input[name="email"]').val();
		if(!email){
			alert("이메일을 입력하세요.");
			$('input[name=email]').focus();
			return false;
		}
		
		let url = $('input[name="url"]').val();
		if(!url){
			alert("URL을 입력하세요.");
			$('input[name=url]').focus();
			return false;
		}
		
		let phone = $('input[name="phone"]').val();
		if(!phone){
			alert("핸드폰 번호를 입력하세요.");
			$('input[name=phone]').focus();
			return false;
		}
		
		if(!$('input[name="hobby"]').is(':checked')){
			alert("취미를 선택하세요");
			
			$('input[name="hobby"]:eq(1)').attr('checked', true)
			return false;
		}
		
		if($('select[name="job"] > option:selected').index() == 0){
			alert("직업을 선택하세요.")
			
			$('select[name="job"] option:eq(1)').attr('selected', true)
			return false;
		}
		
		//입력한 내용을 화면에 출력
		let gender = $('input[name="gender"]:checked').val();
		let hobby = $('input[name="hobby"]:checked') //여러 개가 선택이 돼서 온다. => 배열로 들어온다.
		let hobby_val = '';
		hobby.each(function(){
			hobby_val += $(this).val()+", "
		});
		
		let job = $('select[name="job"] > option:selected').val();
		
		let result = `
			<ul>
			<li>아이디 : ` + user_id + `</li>
			<li>비밀번호 : ` + user_pw + `</li>
			<li>성별 : ` + gender + `</li>
			<li>이메일 : ` + email + `</li>
			<li>URL : ` + url + `</li>
			<li>핸드폰 : ` + phone + `</li>
			<li>취미 : ` + hobby_val + `</li>
			<li>직업 : ` + job + `</li>
			</ul>`;
		
		$('body').html(result)
		return false; // 페이지 이동을 막음.
	});
	
	
});