#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%--
  User: Kristian Lier Seln�s, Kantega AS
  Date: 18.jan.2007
  Time: 16:01:57
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>

<kantega:section id="tittel">
    <aksess:getattribute name="title"/>
</kantega:section>

<kantega:section id="innhold">
    <div class="nyheter">
    <aksess:getcollection name="nyheter" association="Main column" associatedid="/site/nyheter/" descending="true" orderby="publishdate" max="4">
        <div class="forsidenyhet">
            <div class="bilde">
                <aksess:link collection="nyheter"><aksess:getattribute name="image" width="100" height="100" collection="nyheter"/></aksess:link>
            </div>
            <div class="tekst">
                <div class="tittel">
                    <h3><aksess:link collection="nyheter"><aksess:getattribute name="title" collection="nyheter"/></aksess:link></h3>
                </div>
                <div class="sammendrag">
                <aksess:getattribute name="description" collection="nyheter"/>
                <aksess:link collection="nyheter">Les</aksess:link>
                </div>
            </div>
        </div>
    </aksess:getcollection>
    </div>
</kantega:section>


<aksess:include url="/WEB-INF/jsp${symbol_dollar}SITE/include/design/frontpage.jsp"/>

