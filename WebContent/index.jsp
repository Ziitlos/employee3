<%@ taglib tagdir="/WEB-INF/tags" prefix="defTempl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<defTempl:default-template>

    <jsp:attribute name="header">
	</jsp:attribute>

    <jsp:attribute name="content">
        <h1>&Uuml;bersicht Employee</h1>

        <jsp:useBean id="empDao" class="ch.helsana.web.dao.EmpDao" />
        <c:set var="empList" value="${empDao.allEmployee}" />

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
                    <td><fmt:formatDate value="${employee.dob}" pattern="dd.MM.yyyy" /></td>
                    <td><a href="<c:url value="updateEmp.jsp?empno=${employee.empno}" />">Edit</a></td>
                    <td><a href="<c:url value="deleteEmp.jsp?empno=${employee.empno}" />">Delete</a></td>
                </tr>
            </c:forEach>
        </table>

    </jsp:attribute>

</defTempl:default-template>


