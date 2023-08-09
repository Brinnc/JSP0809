<%@ page contentType="text/html;charset=utf-8"%>
<%
/*jsp는 java server page를 의미하며, 이 jsp에 자바코드를 작성할 수 있음.
하지만 클래스 파일이 아니므로, jsp마느이 문법을 지켜서 코드를 작성해야함*/

	String str="Java Full-Stack Developer";
	out.print(str);

	String url="jdbc:oracle:thin/";
	String id="java";
	String pass="1234";

%>