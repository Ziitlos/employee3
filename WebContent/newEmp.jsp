<%@ taglib tagdir="/WEB-INF/tags" prefix="defTempl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<defTempl:default-template>

    <jsp:attribute name="header">
	</jsp:attribute>

    <jsp:attribute name="content">
        <h1>Employee erfassen</h1>

        <c:import url="inc/nav.jsp"/>


        <form name="inform" action="index.jsp" method="post">
            <table border="1">
                <tr>
                    <th>Name</th>
                    <td><input type="text" name="ename" id="ename" value=""></td>
                </tr>
                <tr>
                    <th>Salary</th>
                    <td><input type="text" name="sal" id="sal" value=""></td>
                </tr>
                <tr>
                    <th>GebDat</th>
                    <td><input type="text" name="dob" id="dob" value=""></td>
                </tr>
                <tr>
                    <th>&nbsp;</th>
                    <td><input type="submit" name="absenden" value="absenden"></td>
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

    </jsp:attribute>

</defTempl:default-template>


