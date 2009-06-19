#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%--
  User: Kristian Lier Seln�s, Kantega AS
  Date: 18.jan.2007
  Time: 16:03:13
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/menu" prefix="menu" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="include/header.jsp" />

<div id="Hovedmeny">
    <menu:printlistmenu association="Hovedmeny" depth="4" var="entry" ulclass="menygruppe" liclass="menyinnslag" selectedclass="menyvalgt" openclass="menyapen">
        <a href="${symbol_dollar}{entry.url}">${symbol_dollar}{entry.title}</a>
    </menu:printlistmenu>
</div>

<div id="Smulesti">
    <a href="<aksess:geturl url="${symbol_dollar}SITE"/>"><kantega:label key="breadcrumb.home" bundle="site"/></a>
    <menu:getnavigationpath>
        &nbsp;&gt;&nbsp;<a href="${symbol_dollar}{entry.url}">${symbol_dollar}{entry.title}</a>
    </menu:getnavigationpath>
</div>

<div id="Main column">
    <kantega:getsection id="innhold"/>
</div>

<jsp:include page="include/footer.jsp" />