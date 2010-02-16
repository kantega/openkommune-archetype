<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/menu" prefix="menu" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="include/header.jsp" />

<div id="container">
    <div class="inner">
        <div class="searchField" style="line-height: <aksess:getattribute name="logo" contentid="/" property="height"/>px">
            <form action="<aksess:geturl />/search/" method="post" name="search">
                <div>
                    <kantega:label key="search.submit" bundle="site" />: <input type="text" name="q" size="20" value="${param.q}">
                    <input type="submit" class="button" value="<kantega:label key="search.submit" bundle="site" />">
                </div>
            </form>
        </div>
        <aksess:exists name="logo" contentid="/">
            <a href="<aksess:geturl url="$SITE" />"><aksess:getattribute name="logo" contentid="/" cssclass="logo" /></a>
        </aksess:exists>
        <aksess:exists name="logo" contentid="/" negate="true">
            <h1><aksess:getattribute name="title" contentid="/" /></h1>
        </aksess:exists>

        <div style="clear: both"></div>
        <hr>

        <div id="menu">
            <ul class="hidefromview">
                <li><a href="#Content"><kantega:label key="accessibility.navigation.content" bundle="site"/></a></li>
            </ul>
            <kantega:hassection id="menu" negate="true">
                <!-- Print menu of content as UL list -->
                <menu:printlistmenu association="Global menu" depth="2" var="entry" liclass="item" selectedclass="selected" openclass="open">
                    <a href="${entry.url}">${entry.title}</a>
                </menu:printlistmenu>
            </kantega:hassection>
            <kantega:hassection id="menu">
                <!-- Display template has custom menu -->
                <kantega:getsection id="menu"/>
            </kantega:hassection>
        </div>

        <div id="content">
            <div id="breadcrumbs">
                <kantega:label key="breadcrumb.text" bundle="site" />
                &nbsp;<a href="<aksess:geturl url="$SITE"/>"><kantega:label key="breadcrumb.home" bundle="site"/></a>
                <menu:getnavigationpath>
                    &nbsp;&rsaquo;&nbsp;&nbsp;<a href="${entry.url}">${entry.title}</a>
                </menu:getnavigationpath>
            </div>

            <a class="hidefromview" href="#MainMenu"><kantega:label key="accessibility.navigation.menu" bundle="site"/></a>
            <kantega:getsection id="content" />
            <a class="hidefromview" href="#MainMenu"><kantega:label key="accessibility.navigation.menu" bundle="site"/></a>
        </div>
        <div style="clear: both"></div>
    </div>
</div>

<jsp:include page="include/footer.jsp" />
