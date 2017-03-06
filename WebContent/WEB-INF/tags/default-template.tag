<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="header" fragment="true" %>
<%@ attribute name="content" fragment="true" %>



<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Employee 3</title>
    <!-- Place Common CSS here -->
    <!-- <link href="css/default.css" rel="stylesheet" type="text/css" /> -->

    <link rel="stylesheet" href="./css/default.css" />
    <link rel="stylesheet" href="./css/flatpickr.min.css" />
    <script src="./js/flatpickr.min.js"></script>
    <script src="./js/l10n/de.js"></script>

    <jsp:invoke fragment="header"/>
</head>

<body>
<a href="<c:url value="/index.jsp" />">Home</a><br>
<br>
<jsp:invoke fragment="content" />
</body>
</html>