<%@ taglib tagdir="/WEB-INF/tags" prefix="defTempl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<defTempl:default-template>

	<jsp:attribute name="header">
	</jsp:attribute>

    <jsp:attribute name="content">

		<h1>Delete Employee</h1>


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
			<table border="1">
				<tr>
					<td>Nummer:</td>
					<td><c:out value="${dao.getEmpbyEmpNo(empNummer).empno}" /></td>
				</tr>
				<tr>
					<td>Name:</td>
					<td><c:out value="${dao.getEmpbyEmpNo(empNummer).ename}" /></td>
				</tr>
				<tr>
					<td>Salary:</td>
					<td><c:out value="${dao.getEmpbyEmpNo(empNummer).sal}" /></td>
				</tr>
				<tr>
					<td>Geb. Dat.:</td>
					<td><fmt:formatDate value="${dao.getEmpbyEmpNo(empNummer).dob}" pattern="dd.MM.yyyy" /></td>
				</tr>
			</table>
		</c:if>

	</jsp:attribute>

</defTempl:default-template>