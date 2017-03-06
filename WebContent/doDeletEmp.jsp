<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- START löschen --%>
<%-- Es werden nur POST Request für einen Insert in die DB bearbeitet --%>
<c:if test="${pageContext.request.method == 'POST'}">
    <c:out value="${param.empnoToDelete}"/>
    <jsp:useBean id="deleteEmpDao" class="ch.helsana.web.dao.EmpDao"/>
    <c:set var="deletedEmp" value="${deleteEmpDao.delete(param.empnoToDelete)}"/>

</c:if>
<%-- END löschen --%>
<c:redirect url="index.jsp" />


