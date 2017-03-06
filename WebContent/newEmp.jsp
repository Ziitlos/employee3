<%@ taglib tagdir="/WEB-INF/tags" prefix="defTempl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<defTempl:default-template>

    <jsp:attribute name="header">
	</jsp:attribute>

    <jsp:attribute name="content">
        <h1>Employee erfassen</h1>


        <form name="inform" action="index.jsp" method="post">
            <table border="1">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="ename" id="ename" value=""></td>
                </tr>
                <tr>
                    <td>Salary</td>
                    <td><input type="text" name="sal" id="sal" value=""></td>
                </tr>
                <tr>
                    <td>GebDat</td>
                    <td><input type="text" name="dob" id="dob" value=""></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><input type="submit" name="absenden" value="absenden"></td>
                </tr>
            </table>
        </form>

    </jsp:attribute>

</defTempl:default-template>


