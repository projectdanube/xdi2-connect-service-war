<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@ page import="java.net.URI" %>
<%@ page import="java.net.URI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>XDI Connect - Connect Service</title>
	<link rel="stylesheet" target="_blank" href="style.css" TYPE="text/css" MEDIA="screen">
</head>

<body>

	<% 
		String xdiMessageEnvelope = (String) request.getAttribute("xdiMessageEnvelope");
		if (xdiMessageEnvelope == null) xdiMessageEnvelope = "";
		
		String discoveryKey = (String) request.getAttribute("discoveryKey");
		if (discoveryKey == null) discoveryKey = "";
		
		URI registryEndpointUri = (URI) request.getAttribute("registryEndpointUri");
		
		URI authEndpointUri = (URI) request.getAttribute("authEndpointUri");
		URI fallbackEndpointUri = (URI) request.getAttribute("fallbackAuthEndpointUri");
	%>



	<form id="toAuthService" name="toAuthService" action="<%= fallbackEndpointUri %>" method="post">

		<input type="hidden" name="xdiMessageEnvelope" value="<%= StringEscapeUtils.escapeHtml(xdiMessageEnvelope) %>">
		<input type="hidden" name="discoveryKey" value="<%= discoveryKey %>">
		<input type="hidden" name="registryEndpointUri" value="<%= registryEndpointUri.toString() %>">

	</form>


<script type="text/javascript">
    window.onload=function(){
          document.forms["toAuthService"].submit();
    }
</script>

</body>
</html>
