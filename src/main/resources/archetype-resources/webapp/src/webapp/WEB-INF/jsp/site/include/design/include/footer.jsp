<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>

    <div id="footer">
        <div class="inner">
            <div class="openAksess">Powered by <a href="http://opensource.kantega.no/aksess/">OpenAksess</a></div>
            <kantega:label key="footer.contact" bundle="site" /> <a href="mailto:<aksess:getattribute name="emailAddress" contentid="/" />"><aksess:getattribute name="emailAddress" contentid="/" /></a>
        </div>
    </div>
</body>
</html>
