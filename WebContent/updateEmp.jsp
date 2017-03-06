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
						<th>Nummer:</th>
						<td><input type="text" name="empno" value="<c:out value="${dao.getEmpbyEmpNo(empNummer).empno}" />"></td>
					</tr>
					<tr>
						<th>Name:</th>
						<td><input type="text" name="ename" id="ename" value="<c:out value="${dao.getEmpbyEmpNo(empNummer).ename}" />"></td>
					</tr>
					<tr>
						<th>Salary:</th>
						<td><input type="text" name="sal" id="sal" value="<c:out value="${dao.getEmpbyEmpNo(empNummer).sal}" />"></td>
					</tr>
					<tr>
						<th>Geb. Dat.:</th>
						<td><input type="text" name="dob" id="dob" value="<fmt:formatDate value="${dao.getEmpbyEmpNo(empNummer).dob}" pattern="dd.MM.yyyy" />"></td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>Diesen Employee <input type="submit" name="delete" value="&auml;ndern"></td>
					</tr>
				</table>
			</form>
			<script >
              var example = flatpickr('#dob', {
                enableTime: false,
                dateFormat: "d.m.Y",
                locale: "de",
                weekNumbers: true
              });
			</script>
		</c:if>

	</jsp:attribute>

</defTempl:default-template>