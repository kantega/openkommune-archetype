#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>
<kantega:section id="tittel">
    <kantega:label key="http.404.title" bundle="site"/>
</kantega:section>

<kantega:section id="innhold">
<div class="nyhet">

    <div class="overskrift">
        <h1><kantega:label key="http.404.title" bundle="site"/></h1>
    </div>

    <div class="tekst">
        <kantega:label key="http.404.text" bundle="site"/>
    </div>

</div>
</kantega:section>



<aksess:include url="/WEB-INF/jsp${symbol_dollar}SITE/include/design/standard.jsp"/>
