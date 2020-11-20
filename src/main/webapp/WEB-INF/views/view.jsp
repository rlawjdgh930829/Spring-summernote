<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script><title>Insert title here</title>
</head>
<body>

	<form method="post">
		<textarea id="summernote" name="editordata"></textarea>
	</form>
	<script>
		function sendFile(file, el) {
			var form_data = new FormData();
			form_data.append('file', file);
			$.ajax({
				data: form_data,
				type : "post",
				url: 'summer_image',
				cache :false,
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(img_name) {
						$(el).summernote('editor.insertImage', img_name);
					}
				});
			}
		
		$(function() {
			$('#summernote').summernote({
				 	placeholder: '최대 500자 작성 가능합니다.',
			        height: 300,
			        lang: 'ko-KR',
			        callbacks: {
			        	onImageUpload: function(files, editor, welEditable) {
			        		for(var i = files.length -1; i>=0; i--) {
			        			sendFile(files[i], this);
			        		}
			        	}
			        }
			 });
		});
	</script>
</body>
</html>