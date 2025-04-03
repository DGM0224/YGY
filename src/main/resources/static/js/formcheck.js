$(function() {

	$("#writeForm").on("submit", function() {
		if($("#postTitle").val().length <= 0) {
			alert("제목이 입력되지 않았습니당~\n제목을 입력해주세용~");
			$("#postTitle").focus();
			return false;
		}
				
		if($("#postContent").val().length <= 0) {
			alert("내용이 입력되지 않았습니당~\n내용을 입력해주세용~");
			$("#postContent").focus();
			return false;
		}
	});

	
	$("#detailUpdate").on("click", function() {
		
		$("#checkForm").attr("action", "update");
		$("#checkForm").attr("method", "post");
		$("#checkForm").submit();
				
	});
	
	
	$("#updateForm").on("submit", function() {	
		if($("#postTitle").val().length <= 0) {
			alert("제목이 입력되지 않았습니당~\n제목을 입력해주세용~");
			$("#postTitle").focus();
			return false;
		}
		
		if($("#postContent").val().length <= 0) {
			alert("내용이 입력되지 않았습니당~\n내용을 입력해주세용~");
			$("#postContent").focus();
			return false;
			}
	});
	
	$("#detailDelete").on("click", function() {
		
		$("#checkForm").attr("action", "delete");
		$("#checkForm").attr("method", "post");
		$("#checkForm").submit();
		
	});
	

	
	
	
	
});