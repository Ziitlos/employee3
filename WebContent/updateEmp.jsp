<%@ page import="ch.helsana.web.dao.EmpDao" %>
<%@ page import="ch.helsana.web.model.pojo.Emp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Employee3</title>
</head>

<!-- Die Ausgabe kann in zwei verschiedenen Varianten erfolgen -->
<!--
Variante 1
Über die Schreibweise im Java-Code
-->
<%
    String empNummer = request.getParameter("empno");
    request.setAttribute("empNummer", empNummer);


    EmpDao dao = new EmpDao();
    int empNumToUpdate = Integer.parseInt(empNummer);
    Emp editEmp = dao.getEmpbyEmpNo(empNumToUpdate);
    request.setAttribute("editEmp", editEmp);

%>

<body>
<a href="<c:url value="index.jsp" />">Home</a><br>
<h1>Update</h1>
Nummer: <c:out value="${editEmp.empno}" /><br>
Name: <c:out value="${editEmp.ename}" /><br>
Salary: <c:out value="${editEmp.sal}" /><br>
Geb. Dat.: <fmt:formatDate value="${editEmp.dob}" pattern="dd.MM.yyyy" /> <br>


<hr><hr><hr>

<!--
Variante 2
Nur mit JSTL
-->

<!-- Intance erstellen -->
<jsp:useBean id="dao1" class="ch.helsana.web.dao.EmpDao" />

<!-- Ausgeben -->
Nummer: <c:out value="${dao1.getEmpbyEmpNo(param.empno).empno}" /><br>
Name: <c:out value="${dao1.getEmpbyEmpNo(param.empno).ename}" /><br>
Salary: <c:out value="${dao1.getEmpbyEmpNo(param.empno).sal}" /><br>
Geb. Dat.: <fmt:formatDate value="${dao1.getEmpbyEmpNo(param.empno).dob}" pattern="dd.MM.yyyy" /><br>



</body>
</html>


