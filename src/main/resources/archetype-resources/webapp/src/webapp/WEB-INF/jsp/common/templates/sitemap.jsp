#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%--
  Author: Anders Skar / Kristian Lier Seln�s, Kantega AS
  Date: 14.des.2006
  Time: 15:39:09
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<kantega:section id="tittel">
    <aksess:getattribute name="title"/>
</kantega:section>

<kantega:section id="innhold">
<div class="sidekart">

    <h1><aksess:getattribute name="title"/></h1>

    <aksess:exists name="ingress">
        <div class="ingress">
            <aksess:getattribute name="ingress"/>
        </div>
    </aksess:exists>

    <aksess:setvariable attribute="depth" name="depth"/>
    <aksess:getsitemap name="sidekart" depth="${symbol_dollar}{depth}" associationcategory="Hovedmeny"/>

    <aksess:printsitemap name="sidekart"/>
</div>

</kantega:section>



<aksess:include url="/WEB-INF/jsp${symbol_dollar}SITE/include/design/standard.jsp"></aksess:include>
