#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%--
  Author: Anders Skar / Kristian Lier Seln�s, Kantega AS
  Date: 14.des.2006
  Time: 15:37:48
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<aksess:search/>

<div class="sokeresultat">

    <div class="antallTreff">
        <kantega:label key="search.results.numberofhits" bundle="site"/>: ${symbol_dollar}{numhits}
    </div>

    <c:forEach var="searchHit" items="${symbol_dollar}{searchHits}">
        <div class="treff">

            <a href="${symbol_dollar}{searchHit.url}"><c:out value="${symbol_dollar}{searchHit.title}" escapeXml="false"/></a><br>
            <c:choose>
                <c:when test="${symbol_dollar}{searchHit.contextText != ''}">
                    <c:out value="${symbol_dollar}{searchHit.contextText}" escapeXml="false"/>
                </c:when>
                <c:otherwise><c:out value="${symbol_dollar}{searchHit.summary}" escapeXml="false"/></c:otherwise>
            </c:choose>

            <c:if test="${symbol_dollar}{searchHit.pathElements != null}">
                <div class="smulesti">
                <c:forEach var="pathElement" items="${symbol_dollar}{searchHit.pathElements}">
                    <c:out value="${symbol_dollar}{pathElement.title}" escapeXml="false"/> &gt;
                </c:forEach>
                <c:out value="${symbol_dollar}{searchHit.title}" escapeXml="false"/>
                </div>
            </c:if>
        </div>
    </c:forEach>

    <c:if test="${symbol_dollar}{prevSearchPageUrl != null}">
      <a href="<c:out value="${symbol_dollar}{prevSearchPageUrl}"/>"><kantega:label key="search.results.previous" bundle="site"/></a>
    </c:if>

    <c:forEach var="searchPageUrl" items="${symbol_dollar}{searchPageUrls}" varStatus="status">
        <a href="<c:out value="${symbol_dollar}{searchPageUrl}"/>"><c:out value="${symbol_dollar}{status.index + 1}"/></a>
    </c:forEach>

    <c:if test="${symbol_dollar}{nextSearchPageUrl != null}">
        <a href="<c:out value="${symbol_dollar}{nextSearchPageUrl}"/>"><kantega:label key="search.results.next" bundle="site"/></a>
    </c:if>

</div>
