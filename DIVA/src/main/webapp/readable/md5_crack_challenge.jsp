<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.demandware.vulnapp.flags.*"%>
<%@ page import="com.demandware.vulnapp.sessionmgmt.*"%>
<%@ page import="com.demandware.vulnapp.servlet.*"%>
<%@ page import="com.demandware.vulnapp.challenge.*"%>
<%@ page import="com.demandware.vulnapp.challenge.impl.*"%>
<%@ page import="com.demandware.vulnapp.util.*"%>
<%@ page import="com.demandware.vulnapp.servlet.Dictionary"%>
<%@ page import="java.util.*"%>
<%--

MD5 crack Challenge

 --%>
<%
	DIVAServletRequestWrapper req = (DIVAServletRequestWrapper) request;
	SessionStorage sessionStore = (SessionStorage)req.getInformation(Dictionary.SESSION_STORE_OBJ);
	String flag = (String) req.getInformation(Dictionary.FLAG_VALUE);
	MD5Challenge chall = (MD5Challenge) req.getInformation(Dictionary.CURRENT_CHALLENGE_OBJ);
	chall.handleChallengeRequest(req);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>DIVA - Overview</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<jsp:include page="../jspincludes/include_head.jsp" flush="true"></jsp:include>
</head>
<body>
	<div class="wrapper">
		<div class="box">
			<div class="row row-offcanvas row-offcanvas-left">
				<jsp:include page="../jspincludes/sidebar.jsp" flush="true"></jsp:include>

				<!-- main right col -->
				<div class="column col-sm-10 col-xs-11" id="main">

					<jsp:include page="../jspincludes/topnav.jsp" flush="true"></jsp:include>

					<div class="padding">
						<div class="full col-sm-9">

							<!-- content -->
							<div class="row">

								<!-- main col right -->
								<div class="col">

									<div class="well">
										<h3>Challenge</h3>
									</div>

									<div class="panel panel-default">
									
										<div class="panel-body">
											<div id="challenge">
		<h4>Well done.</h4>
	
		<p>
			Flag: <%=flag%>
		</p>
	
		<h4>But what's this?</h4>
		<% if(chall.b64FileMade()){ %>
			<form autocomplete="off">
				<input type="hidden" name="<%=MD5Challenge.DOWNLOAD_PARAM %>" value="true">
				<input type="submit" value="Download">
			</form>
		<%} else{ %>
			<h5> Error. File could not be made/found</h4>
		<%} %>
	</div>
										</div>
									</div>

							</div>
							<!--/row-->

							<jsp:include page="../jspincludes/footer.jsp" flush="true"></jsp:include>

						</div>
						<!-- /col-9 -->
					</div>
					<!-- /padding -->
				</div>
				<!-- /main -->

			</div>
		</div>
	</div>

</body>
</html>