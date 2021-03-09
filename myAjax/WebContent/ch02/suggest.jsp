<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String[] keywords = {
			"AJAX",
			"AJAX 실전 프로그래밍",
			"자바",
			"자바 프로그래밍",
			"자바 서버 페이지",
			"자바 스터디",
			"자바 서비스",
			"자바캔"
	};
	
	public List search(String keyword) {
		if(keyword == null || keyword.equals(""))
			return Collections.EMPTY_LIST;
		keyword = keyword.toUpperCase();
		List result = new ArrayList(8);
		for(int i=0; i<keywords.length; i++) {
			if(((String)keywords[i]).startsWith(keyword)) {
				result.add(keywords[i]);
			}
		}
		return result;
	}
%>
<%
	request.setCharacterEncoding("utf-8");
	String keyword = request.getParameter("keyword");
	List keywordList = search(keyword);
	out.print(keywordList.size());
	out.print("|");
	for(int i=0; i<keywordList.size(); i++) {
		String key = (String)keywordList.get(i);
		out.print(key);
		if(i < keywordList.size() - 1) {
			out.print(",");
		}
	}
%>

























