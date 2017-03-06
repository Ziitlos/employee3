<%@ taglib tagdir="/WEB-INF/tags" prefix="defTempl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<defTempl:default-template>

    <jsp:attribute name="header">
	</jsp:attribute>

    <jsp:attribute name="content">

        <!-- START neuen Employee erfassen -->
        <%-- Es werden nur POST Request für einen Insert in die DB bearbeitet --%>
        <c:if test="${pageContext.request.method == 'POST'}">
            <c:if test="${(param.ename == '') || (param.sal == '') || (param.dob == '')}"></c:if>

            <c:choose>
                <%-- Employee wird nur eingefügt, wenn alle Felder ausgefüllt sind. --%>
                <c:when test="${(param.ename == '') || (param.sal == '') || (param.dob == '')}">
                    <span style="color: #ff0000"><b>Employee nicht eingef&uuml;gt. Mindestens ein Eingabefeld ist leer.</b></span><br />
                </c:when>
                <c:otherwise>
                    <jsp:useBean id="newEmp" class="ch.helsana.web.model.pojo.Emp" />
                    <jsp:useBean id="newEmpDao" class="ch.helsana.web.dao.EmpDao"/>

                    <jsp:setProperty property="ename" name="newEmp"/>
                    <jsp:setProperty property="sal" name="newEmp"/>
                    <fmt:parseDate pattern="dd.MM.yyyy" value="${param.dob}" var="newDob"/>
                    <jsp:setProperty property="dob" name="newEmp" value="${newDob}"/>
                    <c:set var="setNewEmp" value="${newEmpDao.add(newEmp)}"/>
                    <span style="color: #00bb00"><b>Employee <c:out value="${param.ename}"/> eingef&uuml;gt.</b></span>
                </c:otherwise>
            </c:choose>
        </c:if>
        <!-- END neuen Employee erfassen -->


        <h1>&Uuml;bersicht Employee</h1>

        <a href="<c:url value="newEmp.jsp" />">Employee erfassen</a><br>
        <br>



        <%-- START Alle Employee suchen mit der Angabe OderBy --%>
        <jsp:useBean id="empDaoOrder" class="ch.helsana.web.dao.EmpDao" />

        <c:set var="empListOrderBy" value="${empDaoOrder.getAllEmployeeOrderBy('asc')}" />

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Salary</th>
                <th>GebDat</th>
                <th>&nbsp;</th>
                <th>&nbsp;</th>
            </tr>

            <c:forEach items="${empListOrderBy}" var="employeeOrderBy">
                <tr>
                    <td><c:out value="${employeeOrderBy.empno}" /></td>
                    <td><c:out value="${employeeOrderBy.ename}" /></td>
                    <td><c:out value="${employeeOrderBy.sal}"/></td>
                    <td><fmt:formatDate value="${employeeOrderBy.dob}" pattern="dd.MM.yyyy" /></td>
                    <td><a href="<c:url value="updateEmp.jsp?empno=${employeeOrderBy.empno}" />">Edit</a></td>
                    <td><a href="<c:url value="deleteEmp.jsp?empno=${employeeOrderBy.empno}" />">Delete</a></td>
                </tr>
            </c:forEach>
        </table>

        <%-- ENDE Alle Employee suchen mit der Angabe OderBy --%>


        <%--
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
        --%>




    </jsp:attribute>

</defTempl:default-template>


