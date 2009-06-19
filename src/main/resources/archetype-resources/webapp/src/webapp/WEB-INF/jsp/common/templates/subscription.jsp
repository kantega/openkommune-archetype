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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<kantega:section id="tittel">
    <aksess:getattribute name="title"/>
</kantega:section>

<kantega:section id="innhold">

<div class="abonnement">

    <h1><aksess:getattribute name="title"/></h1>

    <c:choose>

        <c:when test="${symbol_dollar}{meldtAv != null}">
            <div class="ingress">
                <aksess:getattribute name="tekst_avmelding"/>
            </div>
        </c:when>

        <c:when test="${symbol_dollar}{meldtPa != null}">
            <div class="ingress">
                <aksess:getattribute name="tekst_pamelding"/>
            </div>
        </c:when>

        <c:otherwise>

            <aksess:exists name="ingress">
                <div class="ingress">
                    <aksess:getattribute name="ingress"/>
                </div>
            </aksess:exists>


            <form method="post" action="<aksess:getattribute name="url"/>">
                <fieldset class="alternativer">
                    <table>
                        <thead>
                            <tr>
                                <th colspan="2"><kantega:label key="abonnement.overskrift" bundle="site"/></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="valg">
                                <td>
                                    <kantega:label key="abonnement.epost" bundle="site"/>:
                                </td>
                                <td>
                                   <input type="text" name="epost" maxlength="80" title="<kantega:label key="abonnement.epost" bundle="site"/>" value="<c:out value="${symbol_dollar}{epost}"/>">
                                </td>
                            </tr>
                            <tr class="valg">
                                <td><kantega:label key="abonnement.varsling" bundle="site"/>:</td>
                                <td>
                                    <input type="radio" name="interval" value="immediate"> <kantega:label key="abonnement.varsling.interval.umiddelbart" bundle="site"/><br>
                                    <input type="radio" name="interval" value="daily" checked> <kantega:label key="abonnement.varsling.interval.daglig" bundle="site"/><br>
                                    <input type="radio" name="interval" value="weekly"> <kantega:label key="abonnement.varsling.interval.ukentlig" bundle="site"/><br>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </fieldset>

                <fieldset class="kategorier">
                    <table>
                        <thead>
                            <tr>
                                <th><kantega:label key="abonnement.kategori" bundle="site"/></th>
                                <th class="kolonneskille"><kantega:label key="abonnement.meldpa" bundle="site"/></th>
                                <th class="kolonneskille"><kantega:label key="abonnement.meldav" bundle="site"/></th>
                            </tr>
                        </thead>
                        <tbody>
                            <aksess:getcollection name="kategorier" contentlist="kategorier" orderby="title" varStatus="status">
                            <tr class="listerad${symbol_dollar}{status.index%2}">
                                <td><aksess:getattribute name="title" collection="kategorier"/></td>
                                <td class="kolonneskille"><input type="radio" id="kategori_pa_${symbol_dollar}{status.index}" name="<aksess:getattribute name="id" collection="kategorier"/>" value="pa"></td>
                                <td class="kolonneskille"><input type="radio" id="kategori_av_${symbol_dollar}{status.index}" name="<aksess:getattribute name="id" collection="kategorier"/>" value="av"></td>
                            </tr>
                            </aksess:getcollection>
                        </tbody>
                    </table>

                    <p><input type="submit" class="button" value="<kantega:label key="abonnement.submit" bundle="site"/>"/></p>
                </fieldset>
            </form>
        </c:otherwise>
    </c:choose>


 </div>

</kantega:section>



<aksess:include url="/WEB-INF/jsp${symbol_dollar}SITE/include/design/standard.jsp"></aksess:include>
