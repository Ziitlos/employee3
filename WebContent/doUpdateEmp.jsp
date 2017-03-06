<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="defTempl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<defTempl:default-template>
    <jsp:attribute name="content">
        <%-- START update --%>
        <%-- Es werden nur POST Request für einen Insert in die DB bearbeitet --%>
        <c:if test="${pageContext.request.method == 'POST'}">
            <c:out value="${param.empno}"/>
            <jsp:useBean id="updateEmp" class="ch.helsana.web.model.pojo.Emp"/>
            <jsp:useBean id="updateEmpDao" class="ch.helsana.web.dao.EmpDao"/>
            <jsp:setProperty property="empno" name="updateEmp"/>
            <jsp:setProperty property="ename" name="updateEmp"/>
            <jsp:setProperty property="sal" name="updateEmp"/>
            <c:out value="${param.dob}"/>
            <fmt:parseDate pattern="dd.MM.yyyy" value="${param.dob}" var="updateDob"/>
            <jsp:setProperty property="dob" name="updateEmp" value="${updateDob}"/>
            <c:set var="updatedEmp" value="${updateEmpDao.update(updateEmp)}"/>
        </c:if>
        <%-- END update --%>
        <c:redirect url="index.jsp" />
    </jsp:attribute>
</defTempl:default-template>
