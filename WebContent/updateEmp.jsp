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
			<form name="inform" action="doUpdateEmp.jsp" method="post">
				<table border="1">
					<tr>
						<td>Nummer:</td>
						<td><input type="text" name="empno" value="<c:out value="${dao.getEmpbyEmpNo(empNummer).empno}" />"></td>
					</tr>
					<tr>
						<td>Name:</td>
						<td><input type="text" name="ename" value="<c:out value="${dao.getEmpbyEmpNo(empNummer).ename}" />"></td>
					</tr>
					<tr>
						<td>Salary:</td>
						<td><input type="text" name="sal" value="<c:out value="${dao.getEmpbyEmpNo(empNummer).sal}" />"></td>
					</tr>
					<tr>
						<td>Geb. Dat.:</td>
						<td><input type="text" name="dob" value="<fmt:formatDate value="${dao.getEmpbyEmpNo(empNummer).dob}" pattern="dd.MM.yyyy" />"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>Diesen Employee <input type="submit" name="delete" value="&auml;ndern"></td>
					</tr>
				</table>
			</form>
		</c:if>

	</jsp:attribute>

</defTempl:default-template>