<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(자카르타 File Upload API)파일 업로드 폼</title>
</head>
<body>
	<form action="processFileUpload.jsp" method="post" enctype="multipart/form-data">
		파일 1 : <input type="file" name="file1"><br>
		파일 2 : <input type="file" name="file2"><br>
		파일 3 : <input type="file" name="file3"><br>
		파라미터 1 : <input type="text" name="param1"><br>
		파라미터 2 : <input type="text" name="param2"><br>
		파라미터 3 : <input type="text" name="param3"><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>