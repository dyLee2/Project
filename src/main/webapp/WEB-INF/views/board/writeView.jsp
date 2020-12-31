<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
	 	<title>게시판</title>
	</head>
	<body>
	
		<div id="root">
			<header>
				<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
				<h1> 게시판</h1>
			</header>
			
			<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	</script>
			<hr />
			<div>
				<%@include file="nav.jsp" %> 
			</div>
			<hr />
			
			<section id="container">
				<!-- 수정요망 -->
				<form name="writeForm" method="post" action="/board/write">
					<table>
						<tbody>
						<c:if test="${member.mId != null}">
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="gTitle" name="gTitle"  class="chk" title="제목을 입력하세요."/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><textarea id="gContents" name="gContents" class="chk" title="내용을 입력하세요." ></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">작성자</label><input type="text" id="gWriter" name="gWriter" />
								</td>
							<tr>
								<td>						
									<button class = "write_btn" type="button">작성</button>
								</td>
							</tr>	
							</c:if>
							<c:if test="${member.mId == null}">
								<p>로그인 후에 작성하실 수 있습니다.</p>
							</c:if>		
						</tbody>			
					</table>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>