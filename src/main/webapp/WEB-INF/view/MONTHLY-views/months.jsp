<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: serhii.ryzhkov
  Date: 01.08.2023
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

months
<br>
<br>
<button onclick="window.location.href='../../..'">Home</button>
<br>
<br>
<c:forEach var="d" items="${daysListAtt}" varStatus="loop">

    <c:choose>
        <c:when test="${actualDateAtt==d.key}">
            <c:if test="${loop.index == 5}">!!</c:if>
            <button onclick="window.location.href='days?delta=${loop.index}'">
                <p class="red-text" style="color: red">${d.key}</p>
            </button>
            <c:if test="${loop.index == 5}">!!</c:if>
        </c:when>
        <c:otherwise>
            <c:if test="${loop.index == 5}">!!</c:if>
            <button onclick="window.location.href='days?delta=${loop.index}'">${d.key}</button>
            <c:if test="${loop.index == 5}">!!</c:if>
        </c:otherwise>
    </c:choose>


</c:forEach>

<button onclick="window.location.href='setToday'"> Set Today
</button>
<br>
<c:forEach var="d" items="${daysListAtt}">
    ${d.value}
</c:forEach>
<br>

<br>
List of tasks:
<br>
<c:forEach var="t" items="${dayTasksAtt}" varStatus="loop">
    <c:url var="completeButton" value="/complete">
        <c:param name="index" value="${loop.index}"/>
    </c:url>
    <br>
    <br>
    ${t.title}
    ${t.description}
    |||
    <button onclick="window.location.href='${completeButton}'" value="${loop.index}">
            ${t.status}
    </button>
    <br>
</c:forEach>

<br>
<br>
<br>
<input type="button" value="Add new task" onclick="window.location.href='addingNewTask'">
<br>
<br>


Regular tasks:
<br>
<c:forEach var="t" items="${regularAtt}" varStatus="loop">
    <c:url var="addRegButton" value="/addRegularToday">
        <c:param name="index" value="${loop.index}"/>
    </c:url>

    <button onclick="window.location.href='${addRegButton}'" value="${loop.index}">
            ${t.title}
    </button>

    <br>
</c:forEach>
</body>
</html>