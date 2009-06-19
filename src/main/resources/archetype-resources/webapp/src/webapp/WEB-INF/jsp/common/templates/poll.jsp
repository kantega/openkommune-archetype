#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%--
  User: Kristian Lier Seln�s, Kantega AS
  Date: 05.jan.2007
  Time: 13:59:07
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<kantega:section id="tittel">
    <aksess:getattribute name="title"/>
</kantega:section>

<kantega:section id="innhold">

<div class="avstemming">

    <h1><aksess:getattribute name="title"/></h1>

    <aksess:exists name="ingress">
    <div class="ingress">
        <aksess:getattribute name="ingress"/>
    </div>
    </aksess:exists>

    <%@ include file="include/poll.jsp" %>

</div>


</kantega:section>

<aksess:include url="/WEB-INF/jsp${symbol_dollar}SITE/include/design/standard.jsp"></aksess:include>
