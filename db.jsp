<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%
	/*javaSE의 기술을 적용
			-> String(o), Swing(x-윈도우기반디자인), ArrayList(o)
	*/

	//웹브라우저로부터 데이터를 전송 받아서 회원정보에 넣기
	//주소창에 ?를 넣어 대입하는방식 -> get방식전송
	//127.0.0.1:8888/db.jsp?id=scott&name=스캇&phone=017

	//전송 파라미터값(변수) 받기
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");

	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="java";
	String pass="1234";

	Connection con=null;
	PreparedStatement pstmt=null;

	//드라이버
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		out.print("드라이버 로드 성공");
		con=DriverManager.getConnection(url, user, pass);

		if(con!=null){
			out.print("접속 성공");
			String sql="insert into memberjava(member_idx, id, name, phone)";
			sql+=" values(seq_memberjava.nextval, ?, ?, ?)";

			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			

			int result=pstmt.executeUpdate(); //DML실행

			if(result>0){
				out.print("등록성공");
			}
		}

	}catch(ClassNotFoundException e){
		out.print("드라이버 없음");
	}finally{
				if(pstmt!=null){
					try{pstmt.close();	}catch(SQLException e){}
				}

				if(con!=null){
					try{con.close();}catch(SQLException e){}
				}
			}
%>