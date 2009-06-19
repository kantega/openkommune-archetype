#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>
<div class="nyhet">

    <div class="overskrift">
        <h1><kantega:label key="http.500.title" bundle="site"/></h1>
    </div>

    <div class="tekst">
        <kantega:label key="http.500.text" bundle="site"/>
    </div>

</div>

