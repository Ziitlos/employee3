<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="ch.helsana.web.test.Dummy" %>
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

<%
    List<Dummy> dummyList = new ArrayList<Dummy>();
    Dummy dummy1 = new Dummy();
    dummy1.setZahl(1);
    dummy1.setFarbe("Rot");
    dummyList.add(dummy1);

    Dummy dummy2 = new Dummy();
    dummy2.setZahl(2);
    dummy2.setFarbe("Blau");
    dummyList.add(dummy2);

    Dummy dummy3 = new Dummy();
    dummy3.setZahl(3);
    dummy3.setFarbe("Grün");
    dummyList.add(dummy3);

    request.setAttribute("dummyList", dummyList);
%>


<h1>Employee3</h1>

<table border="1">
    <tr>
        <td>Zahl</td>
        <td>Farbe</td>
    </tr>

    <c:forEach items="${dummyList}" var="dum">
        <tr>
            <td><c:out value="${dum.zahl}" /></td>
            <td><c:out value="${dum.farbe}" /></td>
        </tr>
    </c:forEach>
</table>

<br>
<hr>
<br>

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



