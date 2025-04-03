$(function() {

	$(".btnCommend").click(function() {

		var com = $(this).attr("id");
		console.log("com : " + com);

		$.ajax({
			url: "like.ajax",
			type: "post",
			data: { like: com, postNo: $("#postNo").val() },
			dataType: "json",
			success: function(data) {
				var msg = com == 'good' ? "좋아요가" : "싫어요가";
				alert(msg + " 반영 되었습니다.");
				
				$("#good > .like").text(" (" + data.good + ")");
				console.log(data)
				$("#bad > .like").text(" (" + data.bad + ")");
			},
			error: function(xhr, status, error) {
				alert("error : " + xhr.statusText + ", " + status + ", " + error);
			}
		});
	});



	$("#replyWrite").on("click", function() {


		console.log($("#replyForm").css("display"));
		console.log($("#replyForm").is(":visible"));


		if ($("#replyForm").is(":visible")) {

			var $prev = $("#replyTitle").prev();
			if (!$prev.is("#replyForm")) {
				$("#replyForm").slideUp(300);
			}
			setTimeout(function() {
				$("#replyForm").insertBefore("#replyTitle").slideDown(300);
			}, 300);

		} else {
			$("#replyForm").removeClass("d-none")
				.css("display", "none").insertBefore("#replyTitle").slideDown(300);
		}

		$("#replyForm").find("form")
			.attr("id", "replyWriteForm").removeAttr("data-no");
		$("#replyContent").val("");
		$("#replyWriteButton").val("댓글쓰기");

	});



	$(document).on("submit", "#replyWriteForm", function(e) {

		if ($("#replyContent").val().length < 5) {
			alert("댓글은 5자 이상 입력해야 합니다.");
			return false;
		}

		var params = $(this).serialize();
		console.log(params);

		$.ajax({
			"url": "replyWrite.ajax",
			"data": params,
			"type": "post",
			"dataType": "json",
			"success": function(resData) {
				console.log(resData);

				$("#replyList").empty();

				$.each(resData.replyList, function(i, v) {

					var date = new Date(v.replyDate);
					var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10)
						? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"
						+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) + " "
						+ (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + ":"
						+ (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) + ":"
						+ (date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds());

						var result = 
						    '<div class="row border border-top-0 replyRow">' +
							'	<div class="col" style="border: 2px solid hsl(359, 100%, 65%, 0.1);">' + 
							'		<div class="row p-2">' + 
						    '   		<div class="col-4">' +
							'      			<span style="font-family: Bagel Fat One, system-ui;">' + v.replyWriter + '</span>' +
							'   		</div>' +
						    '   		<div class="col-8 text-end">' +
						    (resData.memberId == v.replyWriter
						        ? '       <button class="modifyReply btn btn-outline-success btn-sm" data-no="' + v.replyNo + '">' +
						          '           <span class="icon"><i class="bi bi-pencil-square"></i></span>' +
						          '           <span class="text">수정</span>' +
						          '       </button>' +
						          '       <button class="deleteReply btn btn-outline-warning btn-sm" data-no="' + v.replyNo + '">' +
						          '           <span class="icon"><i class="bi bi-trash"></i></span>' +
						          '           <span class="text">삭제</span>' +
						          '       </button>'
						        : '       <button class="modifyReply btn btn-outline-success btn-sm" data-no="' + v.replyNo + '" disabled>' +
						          '           <span class="icon"><i class="bi bi-pencil-square"></i></span>' +
						          '           <span class="text">수정</span>' +
						          '       </button>' +
						          '       <button class="deleteReply btn btn-outline-warning btn-sm" data-no="' + v.replyNo + '" disabled>' +
						          '           <span class="icon"><i class="bi bi-trash"></i></span>' +
						          '           <span class="text">삭제</span>' +
						          '       </button>'
						    ) +
						    '   		</div>' +
						    '		</div>' +							
						    '		<div class="row">' +
						    '   		<div class="col p-3">' +
						    '       		<pre>' + v.replyContent + '</pre>' +
						    '   		</div>' +
						    '		</div>' +
							'	</div>' + 
							'</div>';

					$("#replyList").append(result);
					$("#replyList").removeClass("text-center");
					$("#replyList").removeClass("p-5");

				});


				$("#replyForm").slideUp(300)
					.add("#replyContent").val("");
			},
			"error": function(xhr, status) {
				console.log("error : " + status);
			}
		});


		return false;
	});



	$(document).on("click", ".modifyReply", function() {


		console.log("수정버튼 클릭 : " + $("#replyForm").css("display"));
		console.log($("#replyForm").is(":visible"));


		console.log($(this).parents(".replyRow"));
		var $replyRow = $(this).parents(".replyRow");


		if ($("#replyForm").is(":visible")) {


			var $next = $replyRow.next();
			if (!$next.is("#replyForm")) {
				$("#replyForm").slideUp(300);
			}
			setTimeout(function() {
				$("#replyForm").insertAfter($replyRow).slideDown(300);
			}, 300);

		} else {
			$("#replyForm").removeClass("d-none")
				.css("display", "none").insertAfter($replyRow).slideDown(300);
		}


		$("#replyForm").find("form")
			.attr({ "id": "replyUpdateForm", "data-no": $(this).attr("data-no") });
		$("#replyWriteButton").val("댓글수정");


		var reply = $(this).parent().parent().next().find("pre").text();
		$("#replyContent").val($.trim(reply));

	});



	$(document).on("submit", "#replyUpdateForm", function() {


		if ($("#replyContent").val().length <= 5) {
			alert("댓글은 5자 이상 입력해야 합니다.");

			return false;
		}


		$("#detailContent > div").append($("#replyForm").slideUp(300));


		var params = $(this).serialize() + "&replyNo=" + $(this).attr("data-no");
		console.log(params);

		$.ajax({
			url: "replyUpdate.ajax",
			type: "patch",
			data: params,
			dataType: "json",
			success: function(resData, status, xhr) {

				console.log(resData);

				$("#replyList").empty();
				$.each(resData.replyList, function(i, v) {


					var date = new Date(v.replyDate);
					var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10)
						? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"
						+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) + " "
						+ (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + ":"
						+ (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) + ":"
						+ (date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds());

						var result = 
						    '<div class="row border border-top-0 replyRow">' +
							'	<div class="col" style="border: 2px solid hsl(359, 100%, 65%, 0.1);">' + 
							'		<div class="row p-2">' + 
						    '   		<div class="col-4">' +
							'      			<span style="font-family: Bagel Fat One, system-ui;">' + v.replyWriter + '</span>' +
							'   		</div>' +
						    '   		<div class="col-8 text-end">' +
						    (resData.memberId == v.replyWriter
						        ? '       <button class="modifyReply btn btn-outline-success btn-sm" data-no="' + v.replyNo + '">' +
						          '           <span class="icon"><i class="bi bi-pencil-square"></i></span>' +
						          '           <span class="text">수정</span>' +
						          '       </button>' +
						          '       <button class="deleteReply btn btn-outline-warning btn-sm" data-no="' + v.replyNo + '">' +
						          '           <span class="icon"><i class="bi bi-trash"></i></span>' +
						          '           <span class="text">삭제</span>' +
						          '       </button>'
						        : '       <button class="modifyReply btn btn-outline-success btn-sm" data-no="' + v.replyNo + '" disabled>' +
						          '           <span class="icon"><i class="bi bi-pencil-square"></i></span>' +
						          '           <span class="text">수정</span>' +
						          '       </button>' +
						          '       <button class="deleteReply btn btn-outline-warning btn-sm" data-no="' + v.replyNo + '" disabled>' +
						          '           <span class="icon"><i class="bi bi-trash"></i></span>' +
						          '           <span class="text">삭제</span>' +
						          '       </button>'
						    ) +
						    '   		</div>' +
						    '		</div>' +							
						    '		<div class="row">' +
						    '   		<div class="col p-3">' +
						    '       		<pre>' + v.replyContent + '</pre>' +
						    '   		</div>' +
						    '		</div>' +
							'	</div>' + 
							'</div>';


					$("#replyList").append(result);

				});


				$("#replyContent").val("");

			},
			error: function(xhr, status, error) {
				alert("ajax 실패 : " + status + " - " + xhr.status);
			}

		});


		return false;
	});



	$(document).on("click", ".deleteReply", function() {


		$("#detailContent-content > div").append($("#replyForm").slideUp(300));
		$("#replyContent").val("");

		var replyNo = $(this).attr("data-no");
		var writer = $(this).parent().prev().find("span").text();
		var postNo = $("#replyForm input[name=postNo]").val();
		var params = "replyNo=" + replyNo + "&postNo=" + postNo;
		console.log(params);

		var result = confirm(writer + "님이 작성한 " + replyNo + "번 댓글을 삭제하시겠습니까?");

		if (result) {
			$.ajax({
				url: "replyDelete.ajax",
				type: "delete",
				data: params,
				dataType: "json",
				success: function(resData, status, xhr) {
					console.log(resData);
					$("#replyList").empty();


					$.each(resData.replyList, function(i, v) {


						var date = new Date(v.replyDate);
						var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10)
							? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"
							+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) + " "
							+ (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + ":"
							+ (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) + ":"
							+ (date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds());

							var result = 
							    '<div class="row border border-top-0 replyRow">' +
								'	<div class="col" style="border: 2px solid hsl(359, 100%, 65%, 0.1);">' + 
								'		<div class="row p-2">' + 
							    '   		<div class="col-4">' +
								'      			<span style="font-family: Bagel Fat One, system-ui;">' + v.replyWriter + '</span>' +
								'   		</div>' +
							    '   		<div class="col-8 text-end">' +
							    (resData.memberId == v.replyWriter
							        ? '       <button class="modifyReply btn btn-outline-success btn-sm" data-no="' + v.replyNo + '">' +
							          '           <span class="icon"><i class="bi bi-pencil-square"></i></span>' +
							          '           <span class="text">수정</span>' +
							          '       </button>' +
							          '       <button class="deleteReply btn btn-outline-warning btn-sm" data-no="' + v.replyNo + '">' +
							          '           <span class="icon"><i class="bi bi-trash"></i></span>' +
							          '           <span class="text">삭제</span>' +
							          '       </button>'
							        : '       <button class="modifyReply btn btn-outline-success btn-sm" data-no="' + v.replyNo + '" disabled>' +
							          '           <span class="icon"><i class="bi bi-pencil-square"></i></span>' +
							          '           <span class="text">수정</span>' +
							          '       </button>' +
							          '       <button class="deleteReply btn btn-outline-warning btn-sm" data-no="' + v.replyNo + '" disabled>' +
							          '           <span class="icon"><i class="bi bi-trash"></i></span>' +
							          '           <span class="text">삭제</span>' +
							          '       </button>'
							    ) +
							    '   		</div>' +
							    '		</div>' +							
							    '		<div class="row">' +
							    '   		<div class="col p-3">' +
							    '       		<pre>' + v.replyContent + '</pre>' +
							    '   		</div>' +
							    '		</div>' +
								'	</div>' + 
								'</div>';


						$("#replyList").append(result);

					});
				},
				error: function(xhr, status, error) {
					alert("ajax 실패 : " + status + " - " + xhr.status);
				}
			});
		}

		return false;
	});
});

