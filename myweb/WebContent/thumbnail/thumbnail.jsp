<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String imagePath = application.getRealPath("upload");
	int size = 10 * 1024 * 1024;
	String fileName = "";
	try {
		MultipartRequest multi = new MultipartRequest(
				request, imagePath, size, "UTF-8", new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		String file = (String)files.nextElement();
		fileName = multi.getFilesystemName(file);
	} catch(Exception e) {
		e.printStackTrace();
	}
	ParameterBlock pb = new ParameterBlock();
	pb.add(imagePath + "/" + fileName);
	RenderedOp rOp = JAI.create("fileload", pb);
	BufferedImage bi = rOp.getAsBufferedImage();
	BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
	Graphics2D g = thumb.createGraphics();
	g.drawImage(bi, 0, 0, 100, 100, null);
	File file = new File(imagePath + "/sm_" + fileName);
	ImageIO.write(thumb, "jpg", file);
%>
<title>이미지 썸네일 예제</title>
</head>
<body>
	* 원본 이미지 * <br>
	<img src="/myweb/upload/<%=fileName %>"><p>
	* 썸네일 이미지 *
	<img src="/myweb/upload/sm_<%=fileName %>">
</body>
</html>















