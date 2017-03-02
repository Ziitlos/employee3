<%@ taglib tagdir="/WEB-INF/tags" prefix="defTempl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<defTempl:default-template>

	<jsp:attribute name="header">
	</jsp:attribute>

    <jsp:attribute name="content">

		<h1>Delete Employee</h1>

		<!-- Employee Nummer aus URL Parameter lesen -->
		<c:set var="empNummer" value="${param.empno}" />

		<!-- Intance erstellen -->
		<jsp:useBean id="dao" class="ch.helsana.web.dao.EmpDao" />

		<!-- Ausgeben -->
		Nummer: <c:out value="${dao.getEmpbyEmpNo(param.empno).empno}" /><br>
		Name: <c:out value="${dao.getEmpbyEmpNo(param.empno).ename}" /><br>
		Salary: <c:out value="${dao.getEmpbyEmpNo(param.empno).sal}" /><br>
		Geb. Dat.: <fmt:formatDate value="${dao.getEmpbyEmpNo(param.empno).dob}" pattern="dd.MM.yyyy" /><br>


	</jsp:attribute>

</defTempl:default-template>