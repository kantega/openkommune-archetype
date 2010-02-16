<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>

<kantega:section id="title">
    <aksess:getattribute name="title"/>
</kantega:section>

<kantega:section id="bodyclass">frontPage</kantega:section>

<kantega:section id="content">
    <div class="news">
    <aksess:getcollection name="news" association="Main column" associatedid="/nyheter/" descending="true" orderby="publishdate" max="4">
        <div class="article">
            <aksess:link collection="news"><aksess:getattribute name="image" width="100" height="100" collection="news"/></aksess:link>
            <h3><aksess:link collection="news"><aksess:getattribute name="title" collection="news"/></aksess:link></h3>
            <p class="leadParagraph">
                <aksess:getattribute name="description" collection="news"/>
                <aksess:link collection="news">Les</aksess:link>
            </div>
        </div>
    </aksess:getcollection>
    </div>
</kantega:section>

<aksess:include url="/WEB-INF/jsp$SITE/include/design/frontpage.jsp"/>

