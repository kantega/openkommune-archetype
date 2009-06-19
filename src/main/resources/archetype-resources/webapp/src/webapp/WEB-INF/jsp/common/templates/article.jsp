#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%--
  Author: Anders Skar / Kristian Lier Selnæs, Kantega AS
  Date: 14.des.2006
  Time: 15:39:09
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>
<kantega:section id="tittel">
    <aksess:getattribute name="title"/>
</kantega:section>

<kantega:section id="innhold">
    <div class="artikkel">
        <div class="overskrift">
            <h1><aksess:getattribute name="title"/></h1>
        </div>

        <aksess:exists name="ingress">
            <div class="ingress">
                <aksess:getattribute name="ingress"/>
            </div>
        </aksess:exists>

        <div class="tekst">

            <aksess:exists name="bilde">
                <div class="bilde">
                    <aksess:getattribute name="bilde" width="200" height="200"/>
                    <div class="bildetekst">
                    <aksess:exists name="bildetekst">
                        <aksess:getattribute name="bildetekst"/>
                    </aksess:exists>
                    <aksess:notexists name="bildetekst">
                        <aksess:getattribute name="bilde" property="name"/>
                    </aksess:notexists>
                    </div>
                </div>
            </aksess:exists>

            <aksess:getattribute name="tekst"/>
        </div>
    </div>
</kantega:section>



<aksess:include url="/WEB-INF/jsp${symbol_dollar}SITE/include/design/standard.jsp"/>

