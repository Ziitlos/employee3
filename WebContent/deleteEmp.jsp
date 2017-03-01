<%@ page import="ch.helsana.web.dao.EmpDao" %>
<%@ page import="ch.helsana.web.model.pojo.Emp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Employee3</title>
</head>

<%
    String empNummer = request.getParameter("empno");
    request.setAttribute("empNummer", empNummer);

    EmpDao dao = new EmpDao();
    int empNumToDelete = Integer.parseInt(empNummer);
    Emp deleteemp = dao.getEmpbyEmpNo(empNumToDelete);
%>

<body>
<a href="<c:url value="index.jsp" />">Home</a><br>
<h1>Delete</h1>
<c:out value="${empNummer}" />
</body>
</html>

