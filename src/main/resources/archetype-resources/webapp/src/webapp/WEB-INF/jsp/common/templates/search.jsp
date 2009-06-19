#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%--
  Author: Anders Skar / Kristian Lier Seln�s / Heikki Henriksen, Kantega AS
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

    <h1><aksess:getattribute name="title"/></h1>

    <aksess:exists name="ingress">
        <p class="ingress">
            <aksess:getattribute name="ingress"/>
        </p>
    </aksess:exists>

    <fieldset>
        <legend><kantega:label key="search.heading" bundle="site"/></legend>
        <form action="<aksess:getattribute name="url"/>" method="post" name="search">
            <p>
                <label><kantega:label key="search.query" bundle="site"/></label>
                <input type="text" name="q" size="20" value="<c:out value="${symbol_dollar}{param.q}"/>">
            </p>
            <p>
                <input type="submit" class="button" value="<kantega:label key="search.submit" bundle="site"/>">
            </p>
        </form>
    </fieldset>
 
    <c:if test="${symbol_dollar}{param.q != null && param.q != ''}">
        <%@include file="include/searchresult.jsp"%>
    </c:if>


</kantega:section>



<aksess:include url="/WEB-INF/jsp${symbol_dollar}SITE/include/design/standard.jsp"></aksess:include>
