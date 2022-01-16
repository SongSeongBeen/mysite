<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link href="/mysite/assets/css/mysite.css" rel="stylesheet" type="text/css">
		<link href="/mysite/assets/css/guestbook.css" rel="stylesheet" type="text/css">
		
	</head>

	<body>
		<div id="wrap">
	
			<!-- header + nav -->
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!-- header + nav -->
		
			<div id="container" class="clearfix">
			
				<!-- //aside -->
				<c:import url="/WEB-INF/views/include/aside.jsp"></c:import>
				<!-- //aside -->
	
				<div id="content">
					
					<div id="content-head" class="clearfix">
						<h3>일반방명록</h3>
						<div id="location">
							<ul>
								<li>홈</li>
								<li>방명록</li>
								<li class="last">일반방명록</li>
							</ul>
						</div>
					</div>
					<!-- //content-head -->
	
					<div id="guestbook">
						<form action="/mysite/gbc" method="get">
						<input type="hidden" name="action" value="add">
							<table id="guestAdd">
								<colgroup>
									<col style="width: 70px;">
									<col>
									<col style="width: 70px;">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<td><label class="form-text" for="input-uname">이름</label></td>
										<td><input id="input-uname" type="text" name="name"></td>
										<td><label class="form-text" for="input-pass">패스워드</label></td>
										<td><input id="input-pass"type="password" name="pass"></td>
									</tr>
									<tr>
										<td colspan="4"><textarea name="content" cols="72" rows="5"></textarea></td>
									</tr>
									<tr class="button-area">
										<td colspan="4" class="text-center"><button type="submit">등록</button></td>
										
									</tr>
								</tbody>
							</table>
							<!-- //guestWrite -->
							
							
						</form>	
						<!-- 리스트영역 -->
						
					<c:forEach items="${guestList}" var="guestVo">
						
						<table class="guestRead">
							<colgroup>
								<col style="width: 10%;">
								<col style="width: 40%;">
								<col style="width: 40%;">
								<col style="width: 10%;">
							</colgroup>
							
							<tr>
								<td>${guestVo.no}</td>
								<td>${guestVo.name}</td>
								<td>${guestVo.regDate}</td>
								<td><a href="/mysite/guestbook?action=deleteForm&no=${guestVo.no}">[삭제]</a></td>
							</tr>
							<tr>
								<td colspan=4 class="text-left">${guestVo.content}</td>
							</tr>
						</table>
						<br>
					</c:forEach>
						<!-- //guestRead -->
					</div>
					<!-- //guestbook -->
				
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