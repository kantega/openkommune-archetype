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
<div class="liste">

    <h1><aksess:getattribute name="title"/></h1>

    <aksess:exists name="ingress">
        <div class="ingress">
            <aksess:getattribute name="ingress"/>
        </div>
    </aksess:exists>


    <aksess:setvariable attribute="sortering" name="sortering"/>
    <aksess:setvariable attribute="visningsvalg" name="visningsvalg"/>
    <c:choose>
        <c:when test="${symbol_dollar}{sortering == 'publishdate'}">
            <c:set var="descending" value="true"/>
        </c:when>
        <c:otherwise>
            <c:set var="descending" value="false"/>
        </c:otherwise>
    </c:choose>
    <aksess:getcollection name="liste" associationcategory="Main column" orderby="${symbol_dollar}{sortering}" descending="${symbol_dollar}{descending}">
        <div class="listeelement">
            <div class="overskrift">
                <h3><aksess:link collection="liste"><aksess:getattribute name="title" collection="liste"/></aksess:link></h3>
            </div>
            <aksess:ifequals name="visningsvalg" value="ingress">
                <div class="ingress">
                    <aksess:getattribute name="ingress" collection="liste"/>
                </div>
            </aksess:ifequals>
            <aksess:ifequals name="visningsvalg" value="ingress_bilde">
                <aksess:exists name="image" collection="liste">
                    <div class="bilde">
                        <aksess:getattribute name="image" collection="liste" width="100"/>
                    </div>
                </aksess:exists>
                <div class="ingress">
                    <aksess:getattribute name="ingress" collection="liste"/>
                </div>
            </aksess:ifequals>
            <div class="clear"></div>
        </div>
    </aksess:getcollection>
</div>

</kantega:section>



<aksess:include url="/WEB-INF/jsp${symbol_dollar}SITE/include/design/standard.jsp"></aksess:include>
