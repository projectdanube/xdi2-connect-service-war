<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@ page import="java.net.URI" %>
<%@ page import="java.net.URI" %>
<% 
	String xdiMessageEnvelope = (String) request.getAttribute("xdiMessageEnvelope");
	if (xdiMessageEnvelope == null) xdiMessageEnvelope = "";
	
	String discoveryKey = (String) request.getAttribute("discoveryKey");
	if (discoveryKey == null) discoveryKey = "";
	
	URI registryEndpointUri = (URI) request.getAttribute("registryEndpointUri");
	
	URI authEndpointUri = (URI) request.getAttribute("authEndpointUri");
	URI fallbackEndpointUri = (URI) request.getAttribute("fallbackAuthEndpointUri");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>XDI Connect - Connect Service</title>

    <link href="bootstrap.cerulean.min.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

    <div class="container">

        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <img src="images/logo-respectnetwork.png">
                <h3><img src="/images/app.png" class="app"> Connect Service</h3>
            </div>
        </div>
        <div class="spacer20"></div>

		<% if (request.getAttribute("error") != null) { %>
	
			<div class="row">
	            <div class="col-md-8 col-md-offset-2">
	                <div class="alert alert-danger" role="alert"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></div>
	            </div>
	        </div>
	
		<% } %>

        <div class="row">
            <div class="col-md-8 col-md-offset-2 bg-gray with-border">

                <div class="spacer20"></div>
                <p><strong>Your personal cloud is hosted by </strong>
                </p>
                <div class="row">
                    <div class="col-xs-4 col-xs-offset-4">
                        <img height="100" src="images/<%= (String) request.getAttribute("cspLogo") %>" />
                    </div>
                </div>
                <div class="spacer15"></div>

                <p>
                    You are going to be redirected to your Personal Cloud located at:
                </p>
                <div class="row">
                    <div class="col-xs-8 col-xs-offset-2 code">
                        <%= fallbackEndpointUri %>
                    </div>
                </div>
                <div class="spacer25"></div>

                <div class="row">
                    <div class="col-xs-12">
                        <div class="pull-right">

                            <form style="display:inline" action="/connect" method="post">
                                <input type="hidden" name="xdiMessageEnvelope" value="<%= StringEscapeUtils.escapeHtml(xdiMessageEnvelope) %>">
                                <input type="hidden" name="clearCookie" value="on">
                                <button type="submit" class="btn btn-default">Go Back</button>
                            </form>

                            <form style="display:inline" action="<%= fallbackEndpointUri %>" method="post">
                                <input type="hidden" name="xdiMessageEnvelope" value="<%= StringEscapeUtils.escapeHtml(xdiMessageEnvelope) %>">
                                <input type="hidden" name="discoveryKey" value="<%= discoveryKey %>">
                                <input type="hidden" name="registryEndpointUri" value="<%= registryEndpointUri.toString() %>">
                                <button type="submit" class="btn btn-primary">Continue to your Personal Cloud</button>
                            </form>

                        </div>
                    </div>
                </div>
                <div class="spacer20"></div>

            </div>
        </div>
        <div class="spacer25"></div>

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <button type="button" class="btn btn-default" data-toggle="collapse" data-target="#techinfo">
                    Show Technical Information
                </button>
            </div>
        </div>
        <div class="spacer15"></div>

        <div id="techinfo" class="row collapse">
            <div class="col-md-8 col-md-offset-2 bg-gray with-border">
                <h4>Technical Information</h4>

                <pre>
<b>Your Cloud Name:</b> <%= StringEscapeUtils.escapeHtml(discoveryKey) %>
<b>Discovered personal cloud:</b> <%= authEndpointUri %>
                </pre>

                <div class="spacer15"></div>
            </div>
        </div>
        <div class="spacer20"></div>

    </div>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js "></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js "></script>
</body>

</html>