<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="/mysite/assets/css/mysite.css" rel="stylesheet" type="text/css">
		<link href="/mysite/assets/css/user.css" rel="stylesheet" type="text/css">
	</head>
	
	<body>
		<div id="wrap">
	
			<!-- header + nav -->
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	
			<div id="container" class="clearfix">
			
				<!-- //aside -->
				<c:import url="/WEB-INF/views/include/aside.jsp"></c:import>
				<!-- //aside -->
	
				<div id="content">
				
					 <!-- //content-head -->
					<div id="content-head">
						<h3>로그인</h3>
						<div id="location">
							<ul>
								<li>홈</li>
								<li>회원</li>
								<li class="last">로그인</li>
							</ul>
						</div>
						<div class="clear"></div>
					</div>
					 <!-- //content-head -->
		
					<div id="user">
						<div id="loginForm">
							<form action="./user" method="get">
		
								<!-- 아이디 -->
								<div class="form-group">
									<label class="form-text" for="input-uid">아이디</label> 
									<input type="text" id="input-uid" name="id" value="" placeholder="아이디를 입력하세요">
								</div>
		
								<!-- 비밀번호 -->
								<div class="form-group">
									<label class="form-text" for="input-pass">비밀번호</label> 
									<input type="text" id="input-pass" name="password" value="" placeholder="비밀번호를 입력하세요"	>
								</div>
								<c:if test="${param.result eq 'fail'}">
									<p>로그인에 실패 했습니다. 다시로그인 해주세요</p>
								</c:if>
								
								<!-- 버튼영역 -->
								<div class="button-area">
									<button type="submit" id="btn-submit">로그인</button>
								</div>
								<input type="hidden" name="action" value="writelogin">
								
							</form>
						</div>
						<!-- //loginForm -->
					</div>
					<!-- //user -->
				</div>
				<!-- //content  -->
				
			</div>
			<!-- //container  -->
	
			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!-- //footer -->
	
		</div>
		<!-- //wrap -->
	
	</body>
	
	
</html>