<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/menu" prefix="menu" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="include/header.jsp" />

<div id="container">
    <div class="inner">
        <div class="searchField" style="line-height: <aksess:getattribute name="logo" property="height"/>px">
            <form action="<aksess:geturl />/search/" method="post" name="search">
                <div>
                    <kantega:label key="search.submit" bundle="site" />: <input type="text" name="q" size="20" value="${param.q}">
                    <input type="submit" class="button" value="<kantega:label key="search.submit" bundle="site" />">
                </div>
            </form>
        </div>
        <aksess:exists name="logo">
            <a href="<aksess:geturl url="$SITE" />"><aksess:getattribute name="logo" cssclass="logo" /></a>
        </aksess:exists>
        <aksess:exists name="logo" negate="true">
            <h1><aksess:getattribute name="title" /></h1>
        </aksess:exists>

        <div style="clear: both"></div>
        <hr>

        <div id="menu">
            <menu:printlistmenu var="entry" depth="2" associationcategory="Global menu" selectedclass="selected">
                <a href="${entry.url}">${entry.title}</a>
            </menu:printlistmenu>
        </div>

        <div id="content">
            <div id="breadcrumbs">
                <kantega:label key="breadcrumb.text" bundle="site" />
                &nbsp;<a href="<aksess:geturl url="$SITE"/>"><kantega:label key="breadcrumb.home" bundle="site"/></a>
                <menu:getnavigationpath>
                    &nbsp;&rsaquo;&nbsp;&nbsp;<a href="${entry.url}">${entry.title}</a>
                </menu:getnavigationpath>
            </div>

            <h1><kantega:getsection id="title" /></h1>

            <aksess:exists name="lead paragraph">
                <p class="leadParagraph">
                    <aksess:getattribute name="lead paragraph" />
                </p>
            </aksess:exists>

            <aksess:getattribute name="content" />
        </div>
        <div style="clear: both"></div>
    </div>
</div>

<jsp:include page="include/footer.jsp" />
