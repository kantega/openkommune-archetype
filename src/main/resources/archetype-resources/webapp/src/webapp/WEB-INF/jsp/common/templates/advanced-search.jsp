#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@ page import="java.util.List" %>
<%--
  Author: Anders Skar / Kristian Lier Selnæs / Heikki Henriksen, Kantega AS
  Date: 14.des.2006
  Time: 15:39:09
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<kantega:section id="head">
    <script type="text/javascript">
        function validerSok(form){
            var feilmeldingsboks = document.getElementById('Feilmelding');
            if(form.allWords.value.length < 3 && form.phrase.value.length < 3) {
                feilmeldingsboks.innerHTML = '<kantega:label key="advancedsearch.error.min3chars" bundle="site"/>';
                feilmeldingsboks.style.display = 'block';
                return false;
            }
            return true;
        }
    </script>
</kantega:section>

<kantega:section id="tittel">
    <aksess:getattribute name="title"/>
</kantega:section>


<kantega:section id="innhold">


    <div class="avansertsok">

        <h1><aksess:getattribute name="title"/></h1>

        <aksess:exists name="ingress">
            <p class="ingress">
                <aksess:getattribute name="ingress"/>
            </p>
        </aksess:exists>

        <div class="feilmelding" id="Feilmelding" style="display: none;">
        </div>

        <form method="post" action="<aksess:getattribute name="url"/>" name="search" onsubmit="return validerSok(this)">

            <fieldset>
                <legend><kantega:label key="advancedsearch.title" bundle="common"/></legend>

                <p><label for="parent"><kantega:label key="advancedsearch.searchin" bundle="common"/>:</label>
                    <aksess:getsitemap name="nettkart" association="Hovedmeny"/>
                    <select name="parent" id="parent">
                        <option value="${symbol_dollar}{nettkart.id}"><kantega:label key="advancedsearch.searchin.entiresite" bundle="common"/></option>
                        <c:forEach items="${symbol_dollar}{nettkart.children}" var="nettside">
                            <option value="${symbol_dollar}{nettside.id}" <c:if test="${symbol_dollar}{param.parent == nettside.id}"> selected</c:if>>${symbol_dollar}{nettside.title}</option>
                        </c:forEach>
                    </select></p>

                <p><label for="allWords"><kantega:label key="advancedsearch.allwords" bundle="common"/>:</label>
                    <input type="text" class="tekstfelt" name="allWords" id="allWords" size="40" value="<c:out value="${symbol_dollar}{param.allWords}"/>"></p>

                <p><label for="phrase"><kantega:label key="advancedsearch.phrase" bundle="common"/>:</label>
                    <input type="text" class="tekstfelt" name="phrase" id="phrase" size="40" value="<c:out value="${symbol_dollar}{param.phrase}"/>"></p>

                <p><label for="notQ"><kantega:label key="advancedsearch.notwords" bundle="common"/>:</label>
                    <input type="text" class="tekstfelt" name="notQ" id="notQ" size="40" value="<c:out value="${symbol_dollar}{param.notQ}"/>"></p>

                <p><input class="button" type="submit" value="<kantega:label key="advancedsearch.submit" bundle="common"/>"></p>

            </fieldset>

        </form>
        <c:if test="${symbol_dollar}{(param.allWords != null && param.allWords != '') || (param.phrase != null && param.phrase != '')}">
            <%@include file="include/searchresult.jsp"%>
        </c:if>

    </div>

</kantega:section>



<aksess:include url="/WEB-INF/jsp${symbol_dollar}SITE/include/design/standard.jsp"/>
