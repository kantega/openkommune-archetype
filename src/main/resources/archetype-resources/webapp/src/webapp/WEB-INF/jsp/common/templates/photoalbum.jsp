<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/photo" prefix="photo" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>

<kantega:section id="title">
    <aksess:getattribute name="title"/>
</kantega:section>

<kantega:section id="bodyclass">photoalbum</kantega:section>

<kantega:section id="content">
    <h1><aksess:getattribute name="title"/></h1>

    <aksess:exists name="lead paragraph">
        <p class="leadParagraph">
            <aksess:getattribute name="lead paragraph"/>
        </p>
    </aksess:exists>

    <aksess:setvariable name="photoalbum" attribute="mediafolder"/>
    <div class="image">
        <photo:image url="/multimedia.ap" width="400" height="300"/>
        <div class="copyright">
            <kantega:label key="photoalbum.picture" bundle="site"/> <photo:image property="offset"/> <kantega:label key="photoalbum.of" bundle="site"/> <photo:image property="total"/> &copy; <photo:image property="author" defaultvalue=""/>
        </div>
        <div class="title">
            <photo:image property="title"/>
        </div>
        <div class="caption">
            <photo:image property="description"/>
        </div>
    </div>

    <div class="navigation">
        <photo:navigate cssclass="forrige" offset="-1">&lsaquo; <kantega:label key="photoalbum.previous" bundle="site"/></photo:navigate>
        <photo:navigate cssclass="neste" offset="1"><kantega:label key="photoalbum.next" bundle="site"/> &rsaquo;</photo:navigate>
    </div>

    <div class="index">
        <table>
            <tr>
                <td class="previous">
                    <photo:navigate offset="-1">
                        <img src="<aksess:geturl url="/bitmaps/common/img_link_left.gif"/>" alt="<kantega:label key="photoalbum.group.previous" bundle="site" />">
                    </photo:navigate>
                </td>
                <photo:index width="200" height="85" max="4" cssclass="bildealbumBilde" selectedcssclass="bildealbumBildeValgt" space="4" />
                <td class="next">
                    <photo:navigate offset="1">
                        <img src="<aksess:geturl url="/bitmaps/common/img_link_right.gif"/>" alt="<kantega:label key="photoalbum.group.next" bundle="site" />">
                    </photo:navigate>
                </td>
            </tr>
        </table>
    </div>
</kantega:section>

<aksess:include url="/WEB-INF/jsp$SITE/include/design/standard.jsp"/>
