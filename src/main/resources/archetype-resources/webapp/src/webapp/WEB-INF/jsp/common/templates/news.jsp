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

<kantega:section id="tittel">
    <aksess:getattribute name="title"/>
</kantega:section>

<kantega:section id="innhold">

<div class="nyhetsarkiv">

    <h1><aksess:getattribute name="title"/></h1>

    <aksess:exists name="ingress">
        <div class="ingress">
            <aksess:getattribute name="ingress"/>
        </div>
    </aksess:exists>
    
    <fieldset>
        <legend><kantega:label key="news.heading" bundle="site"/></legend>

        <form action="" method="post">
            <select name="year">
                <option value="-1"><kantega:label key="news.chooseyear" bundle="site"/></option>
                <c:forEach var="y" items="${symbol_dollar}{yearList}">
                <option value="${symbol_dollar}{y}"<c:if test="${symbol_dollar}{y == selectedYear}"> selected="selected"</c:if>>${symbol_dollar}{y}</option>
                </c:forEach>
            </select>

            <select name="month">
                <option value="-1"><kantega:label key="news.choosemonth" bundle="site"/></option>
                <c:forEach var="m" items="${symbol_dollar}{monthMap}">
                <option value="${symbol_dollar}{m.key}"<c:if test="${symbol_dollar}{m.key == selectedMonth}"> selected="selected"</c:if>>${symbol_dollar}{m.value}</option>
                </c:forEach>
            </select>

            <input type="submit" value="<kantega:label key="news.submit" bundle="site"/>" class="button">
        </form>
    </fieldset>


    <table class="liste">
        <thead>
            <tr>
                <th width="20%"><kantega:label key="news.publishdate" bundle="site"/></th>
                <th class="kolonneskille" width="80%"><kantega:label key="news.title" bundle="site"/></th>
            </tr>
        </thead>
        <tbody>
        <aksess:getcollection name="nyheter" association="Main column" orderby="publishdate" descending="true" publishedfromdate="${symbol_dollar}{fromDate}" publishedtodate="${symbol_dollar}{toDate}" max="${symbol_dollar}{max}" showarchived="${symbol_dollar}{showArchived}" keyword="${symbol_dollar}{keyword}" varStatus="status">
            <tr class="listerad${symbol_dollar}{status.index%2}">
                <td><aksess:getmetadata name="publishdate" collection="nyheter"/></td>
                <td class="kolonneskille"><aksess:link collection="nyheter"><aksess:getattribute name="title" collection="nyheter"/></aksess:link></td>
            </tr>
        </aksess:getcollection>
        </tbody>
    </table>

</div>
</kantega:section>



<aksess:include url="/WEB-INF/jsp${symbol_dollar}SITE/include/design/standard.jsp"></aksess:include>
