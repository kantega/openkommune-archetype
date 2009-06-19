#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%--
  User: Kristian Lier Seln�s, Kantega AS
  Date: 19.jan.2007
  Time: 10:05:01
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><kantega:getsection id="tittel"/></title>
    <!--<link rel="shortcut icon" href="favicon.ico"> -->
    <link rel="stylesheet" type="text/css" href="<aksess:geturl url="/css/common/reset.css"/>" media="all">
    <link rel="stylesheet" type="text/css" href="<aksess:geturl url="/css/common/base.css"/>" media="all">
    <link rel="stylesheet" type="text/css" href="<aksess:geturl url="/css${symbol_dollar}SITE/standard-templates.css"/>" media="all">
    <link rel="stylesheet" type="text/css" href="<aksess:geturl url="/css${symbol_dollar}SITE/site.css"/>" media="all">
    <link rel="stylesheet" type="text/css" href="<aksess:geturl url="/css${symbol_dollar}SITE/print.css"/>" media="print">
    <kantega:hassection id="head">
        <kantega:getsection id="head"/>
    </kantega:hassection>
</head>
<body>
