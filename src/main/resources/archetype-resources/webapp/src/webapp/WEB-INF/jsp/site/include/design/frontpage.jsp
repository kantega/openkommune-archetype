#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%--
  User: Kristian Lier Seln�s, Kantega AS
  Date: 19.jan.2007
  Time: 10:04:06
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="include/header.jsp" />

<div id="Main column">
    <kantega:getsection id="innhold"/>
</div>


<jsp:include page="include/footer.jsp" />