<%@page import="vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.TblProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tbl_Product 테이블 dao </title>
<link rel="stylesheet" href="css/table.css">
</head>
<body>
<%
TblProductDao dao = TblProductDao.getInstance();
List<Product> list = dao.selectByCategory("B1");  //카테고리값 변경 직접 문자열값 변경 
// 결과 리스트를 브라우저에 출력하고 싶다. ---> table 태그 사용
// dao 잘 싱행되는지 간단 테스트 
// out.print(list);
%>





<h2>카테고리별 상품 목록</h2>
<table>
		<tr id ="productH">
		     <td style="width:100px;">번호</td>
		     <th>카테고리</th>
		     <th>상품명</th>
		     <th>상품코드</th>
		     <th>가격</th>
		</tr>
		
			<%
				for(int i=0;i<list.size();i++){
					// list.get(i)는 Product 타입입니다. 
					Product temp = list.get(i);
			%>
		<tr id="product">
<%-- 		
		    <td style="width:100px;"><%= i+1 %></td>
			<td><%= list.get(i) %></td>
			<td><%= list.get(i) %></td> 
			<td><%= list.get(i) %></td>
			<td><%= list.get(i) %></td>
			 --%>
			
			<td style="width:100px;"><%= i+1 %></td>
			<td><%= list.get(i).getCategory() %></td>
			<td><%= list.get(i).getPname() %></td> <!-- 왼쪽 정렬 -->
			<td><%= list.get(i).getPcode() %></td>
			<td><%= String.format("%,6d",temp.getPrice())%></td> <!-- 오른쪽 정렬 -->
		
		</tr>
			<%
				}
			%>
			
	
	</table>


</body>
</html>