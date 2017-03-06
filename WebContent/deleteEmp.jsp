<%@ taglib tagdir="/WEB-INF/tags" prefix="defTempl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<defTempl:default-template>

	<jsp:attribute name="header">
	</jsp:attribute>

    <jsp:attribute name="content">

		<h1>Delete Employee</h1>
		<c:import url="inc/nav.jsp"/>


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
			<form name="inform" action="doDeletEmp.jsp" method="post">
				<input type="hidden" name="empnoToDelete" value="${dao.getEmpbyEmpNo(empNummer).empno}">
				<table border="1">
					<tr>
						<th>Nummer:</th>
						<td><c:out value="${dao.getEmpbyEmpNo(empNummer).empno}" /></td>
					</tr>
					<tr>
						<th>Name:</th>
						<td><c:out value="${dao.getEmpbyEmpNo(empNummer).ename}" /></td>
					</tr>
					<tr>
						<th>Salary:</th>
						<td><c:out value="${dao.getEmpbyEmpNo(empNummer).sal}" /></td>
					</tr>
					<tr>
						<th>Geb. Dat.:</th>
						<td><fmt:formatDate value="${dao.getEmpbyEmpNo(empNummer).dob}" pattern="dd.MM.yyyy" /></td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>Diesen Employee <input type="submit" name="delete" value="l&ouml;schen"></td>
					</tr>
				</table>
			</form>
		</c:if>

	</jsp:attribute>

</defTempl:default-template>