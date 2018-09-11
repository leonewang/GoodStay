function delete_upload(upload_id) {
	alert("delete ?");
	
	var url = "${pageContext.request.contextPath }/deleteUploadServlet";
	var args = {
		"upload_id" : upload_id,
		"time" : new Date()
	};

	$.post(url, args, function() {});
	
//	$.ajax({
//		type : "POST",
//		url : '/GoToStuff/deleteUpload' + upload_id,
//		success : function(msg) {
//			alert("delete success");
//		}
//	});
};