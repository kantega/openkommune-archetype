<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/menu" prefix="menu" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="include/header.jsp" />

<div id="MainMenu">
    <ul class="hidefromview">
        <li><a href="#Content"><kantega:label key="accessibility.navigation.content" bundle="site"/></a></li>
    </ul>
    <kantega:hassection id="menu" negate="true">
        <!-- Print menu of content as UL list -->
        <menu:printlistmenu association="Global menu" depth="4" var="entry" ulclass="group" liclass="item" selectedclass="selected" openclass="open">
            <a href="${entry.url}">${entry.title}</a>
        </menu:printlistmenu>
    </kantega:hassection>
    <kantega:hassection id="menu">
        <!-- Display template has custom menu -->
        <kantega:getsection id="menu"/>
    </kantega:hassection>
</div>

<div id="Breadcrumbs">
    <a href="<aksess:geturl url="$SITE"/>"><kantega:label key="breadcrumb.home" bundle="site"/></a>
    <menu:getnavigationpath>
        &nbsp;&gt;&nbsp;<a href="${entry.url}">${entry.title}</a>
    </menu:getnavigationpath>
</div>

<div id="Content">
    <a class="hidefromview" href="#MainMenu"><kantega:label key="accessibility.navigation.menu" bundle="site"/></a>
    <kantega:getsection id="content"/>
    <a class="hidefromview" href="#MainMenu"><kantega:label key="accessibility.navigation.menu" bundle="site"/></a>
</div>

<jsp:include page="include/footer.jsp" />