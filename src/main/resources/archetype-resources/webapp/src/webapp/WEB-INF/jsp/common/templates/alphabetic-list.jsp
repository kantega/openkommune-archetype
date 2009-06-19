#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%--
  Author: Kristian Lier Seln�s, Kantega AS
  Date: 28.sep.2007
  Time: 13:12:09

  - Bruk innholdsmal title-summary.xml.
  - Kj�res med AlphabeticalListController.
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
         <p class="ingress"><aksess:getattribute name="ingress" /></p>
     </aksess:exists>


     <p>
         <kantega:label key="alphabeticlist.chooseletter" bundle="site"/>:<br>
         <c:forEach items="${symbol_dollar}{letters}" var="letter" varStatus="status">
             <a href="${symbol_pound}${symbol_dollar}{letter.key}"><c:out value="${symbol_dollar}{letter.key}"/></a>
             <c:if test="${symbol_dollar}{!status.last}"> | </c:if>
         </c:forEach>
     </p>

     <ul class="alfabetiskListe">
     <c:forEach items="${symbol_dollar}{letters}" var="letter" varStatus="outerStatus">
         <li><a name="${symbol_dollar}{letter.key}" class="letter">${symbol_dollar}{letter.key}</a>
             <ul>
            <c:forEach items="${symbol_dollar}{letter.value}" var="content" varStatus="innerStatus">
                 <li><a href="${symbol_dollar}{content.url}">${symbol_dollar}{content.title}</a></li>
            </c:forEach>
             </ul>
         </li>
     </c:forEach>
     </ul>

</kantega:section>



<aksess:include url="/WEB-INF/jsp${symbol_dollar}SITE/include/design/standard.jsp"/>
