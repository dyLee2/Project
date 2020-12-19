<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				//삭제 메시지
				var deleteMessage = confirm("삭제하시겠습니까?");
				if(deleteMessage == true){
				
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
				}
			})
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/board/list";
			})
		})
	</script>
	
	<body>
	
			
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %> 
			</div>
			
			<hr />
			
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="gNo" name="gNo" value="${read.gNo}" />
				</form>
				<table>
					<tbody>
						<tr>
							<td>
								<label for="gTitle">제목</label><input type="text" id="gTitle" name="gTitle" value="${read.gTitle}" readonly="readonly" />
							</td>
						</tr>	
						<tr>
							<td>
								<label for="gContent">내용</label><textarea id="gContents" name="gContents" readonly="readonly"><c:out value="${read.gContents}" /></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label for="writer">작성자</label><input type="text" id="gWriter" name="gWriter" value="${read.gWriter}" />
							</td>
						</tr>
						<tr>
							<td>
								<label for="gDate">작성날짜</label>
								<fmt:formatDate value="${read.gDate}" pattern="yyyy-MM-dd" />					
							</td>
						</tr>		
					</tbody>			
				</table>
				<div>
					<button type="submit" class="update_btn">수정</button>
					<button type="submit" class="delete_btn">삭제</button>
					<button type="submit" class="list_btn">목록</button>	
				</div>
			</section>
			<hr />
		</div>
	</body>
</html>