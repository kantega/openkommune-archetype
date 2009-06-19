#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%--
  Author: Anders Skar / Kristian Lier Seln�s, Kantega AS
  Date: 14.des.2006
  Time: 15:39:09
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/photo" prefix="photo" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>
<kantega:section id="tittel">
    <aksess:getattribute name="title"/>
</kantega:section>

<kantega:section id="innhold">
    <div class="bildealbum">

        <h1><aksess:getattribute name="title"/></h1>

        <aksess:exists name="ingress">
            <div class="ingress">
                <aksess:getattribute name="ingress"/>
            </div>
        </aksess:exists>
 
        <aksess:setvariable name="photoalbum" attribute="bildemappe"/>
        <div class="bilde">
            <photo:image url="/multimedia.ap" width="400" height="300"/>
            <div class="copyright">
                <kantega:label key="photoalbum.picture" bundle="site"/> <photo:image property="offset"/> <kantega:label key="photoalbum.of" bundle="site"/> <photo:image property="total"/> &copy; <photo:image property="author" defaultvalue=""/>
            </div>
            <div class="bildetittel">
                <photo:image property="title"/>
            </div>
            <div class="bildetekst">
                <photo:image property="description"/>
            </div>

        </div>


        <div class="navigasjon">
            <photo:navigate cssclass="forrige" offset="-1"><kantega:label key="photoalbum.previous" bundle="site"/></photo:navigate>
            <photo:navigate cssclass="neste" offset="1"><kantega:label key="photoalbum.next" bundle="site"/></photo:navigate>
        </div>

        <div class="index">
            <table>
                <tr>
                    <td class="forrige"><photo:navigate offset="-4"><img src="<aksess:geturl url="/bitmaps/common/img_link_left.gif"/>" alt="<kantega:label key="photoalbum.group.previous" bundle="site"/>"></photo:navigate></td>
                    <photo:index width="85" height="85" max="4" cssclass="bildealbumBilde" selectedcssclass="bildealbumBildeValgt" space="4"/>
                    <td class="neste"><photo:navigate offset="4"><img src="<aksess:geturl url="/bitmaps/common/img_link_right.gif"/>" alt="<kantega:label key="photoalbum.group.next" bundle="site"/>"></photo:navigate></td>
                </tr>
            </table>
        </div>

    </div>

    </div>


</kantega:section>



<aksess:include url="/WEB-INF/jsp${symbol_dollar}SITE/include/design/standard.jsp"></aksess:include>
