<%@ taglib tagdir="/WEB-INF/tags" prefix="defTempl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<defTempl:default-template>

	<jsp:attribute name="header">
	</jsp:attribute>

    <jsp:attribute name="content">

		<h1>Update Employee</h1>

		<jsp:useBean id="zahlChecker" class="ch.helsana.web.helper.ZahlChecker" />

		<!-- Employee Nummer aus URL Parameter lesen -->
		<c:set var="empNummer" value="${param.empno}" />

		<!-- Check ob URL Param empNummer eine Zahl ist, wenn nicht wird als default Wert 0 gesetzt -->
		<c:if test="${!zahlChecker.isEsEineZahl(empNummer)}">
			<c:set var="empNummer" value="0" />
		</c:if>

		<!-- Intance erstellen -->
		<jsp:useBean id="dao" class="ch.helsana.web.dao.EmpDao" />

		<c:if test="${empty dao.getEmpbyEmpNo(empNummer)}">
			Kein Employee gefunden.
		</c:if>

		<c:if test="${not empty dao.getEmpbyEmpNo(empNummer)}">
			<!-- Ausgeben -->
			Nummer: <c:out value="${dao.getEmpbyEmpNo(empNummer).empno}" /><br>
			Name: <c:out value="${dao.getEmpbyEmpNo(empNummer).ename}" /><br>
			Salary: <c:out value="${dao.getEmpbyEmpNo(empNummer).sal}" /><br>
			Geb. Dat.: <fmt:formatDate value="${dao.getEmpbyEmpNo(empNummer).dob}" pattern="dd.MM.yyyy" /><br>
		</c:if>

	</jsp:attribute>

</defTempl:default-template>