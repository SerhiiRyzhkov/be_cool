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

days
<br>
<br>
<button onclick="window.location.href='../../..'">Home</button>
<br>
<br>
<c:forEach var="d" items="${datesListAtt}" varStatus="loop">

    <c:choose>
        <c:when test="${actualDateAtt==d.key}">
            <c:if test="${loop.index == 5}">!!</c:if>
            <button onclick="window.location.href='${urlAtt}?delta=${loop.index}'">
                <p class="red-text" style="color: red">${d.value}</p>
            </button>
            <c:if test="${loop.index == 5}">!!</c:if>
        </c:when>
        <c:otherwise>
            <c:if test="${loop.index == 5}">!!</c:if>
            <button onclick="window.location.href='${urlAtt}?delta=${loop.index}'">${d.value}</button>
            <c:if test="${loop.index == 5}">!!</c:if>
        </c:otherwise>
    </c:choose>


</c:forEach>

<button onclick="window.location.href='setToday${prefixAtt}'"> Set Today
</button>
<br>

<br>

<br>
List of tasks:
<br>
<c:forEach var="t" items="${toDoAtt}" varStatus="loop">
    <c:url var="completeButton" value="/complete${prefixAtt}">
        <c:param name="index" value="${loop.index}"/>
    </c:url>
    <c:url var="deleteButton" value="/delete${prefixAtt}">
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
    <button onclick="window.location.href='${deleteButton}'" value="${loop.index}">DELETE</button>
</c:forEach>

<br>
<br>
<br>
<input type="button" value="Add new task" onclick="window.location.href='addingNewTask${prefixAtt}'">
<br>
<input type="button" value="SetRoutine" onclick="window.location.href='setRoutine${prefixAtt}'">
<br>


Frequently tasks:
<br>
<c:forEach var="t" items="${frequentlyAtt}" varStatus="loop">
    <c:url var="addFreqButton" value="/addFrequentlyToday${prefixAtt}">
        <c:param name="index" value="${loop.index}"/>
    </c:url>

    <button onclick="window.location.href='${addFreqButton}'" value="${loop.index}">
            ${t.title}
    </button>

    <br>
</c:forEach>



</body>
</html>
