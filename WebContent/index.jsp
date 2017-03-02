<%@ page import="java.util.List" %>
<%@ page import="ch.helsana.web.dao.EmpDao" %>
<%@ page import="ch.helsana.web.model.pojo.Emp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Employee3</title>

</head>

<body>

<h1>Employee3</h1>

<%
    EmpDao empDao = new EmpDao();
    List<Emp> empList = empDao.getAllEmployee();
    request.setAttribute("empList", empList);
%>

<table border="1">
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Salary</td>
        <td>GebDat</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>

    <c:forEach items="${empList}" var="employee">
        <tr>
            <td><c:out value="${employee.empno}" /></td>
            <td><c:out value="${employee.ename}" /></td>
            <td><c:out value="${employee.sal}"/></td>
            <td><c:out value="${employee.dob}"/></td>
            <td><a href="<c:url value="updateEmp.jsp?empno=${employee.empno}" />">Edit</a></td>
            <td><a href="<c:url value="deleteEmp.jsp?empno=${employee.empno}" />">Delete</a></td>
        </tr>
    </c:forEach>
</table>


</body>
</html>



