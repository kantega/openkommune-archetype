<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="${aksess_locale.language}">
<head>
    <title><kantega:getsection id="title"/></title>
    <meta name="generator" content="OpenAksess">
    <!--<link rel="shortcut icon" href="favicon.ico"> -->
    <link rel="stylesheet" type="text/css" href="<aksess:geturl url="/css/common/reset.css"/>" media="all">
    <link rel="stylesheet" type="text/css" href="<aksess:geturl url="/css/common/base.css"/>" media="all">
    <link rel="stylesheet" type="text/css" href="<aksess:geturl url="/css$SITE/default.css"/>" media="all">
    <link rel="stylesheet" type="text/css" href="<aksess:geturl url="/css$SITE/print.css"/>" media="print">

    <script type="text/javascript" src="<aksess:geturl url="/js/common/jquery-1.4.1.min.js"/>"></script>
    <script type="text/javascript" src="<aksess:geturl url="/js$SITE/default.jjs"/>"></script>
    <kantega:hassection id="head">
        <kantega:getsection id="head"/>
    </kantega:hassection>
</head>
<body<kantega:hassection id="bodyclass"> class="<kantega:getsection id="bodyclass"/>"</kantega:hassection>>
