<html>
<head>
<title>Welcome Page</title>
</head>
<frameset rows="30,70" bordercolor="#326F74" border="0">
	<frame name="banner" scrolling="no" noresize target="_main"
		src="banner.jsp">
	<frameset rows="*" cols="190,*" frameborder="no" bordercolor="#326F74"
		border="0">
		<frame name="contents" scrolling="no" noresize target="_main"
			src="menu.jsp">
		<frame name="main" scrolling="yes" noresize src="blank.jsp">
	</frameset>
	<noframes>
		<body>
			<p>This page uses frames, but your browser doesn't support them.</p>
		</body>
	</noframes>
</frameset>

</html>