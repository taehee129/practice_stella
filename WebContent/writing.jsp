<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "java.util.*,model.message.*, model.member.*"%>
  <jsp:useBean id="data" class="model.message.MessageVO" scope="request"/>  

<!DOCTYPE HTML>
<!--
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->


<html>

	<head>
		<title>Generic - Stellar by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<script type="text/javascript">
			function move(mnum){
				documnet.location.href="writing.jsp?mnum="+mnum;
				
			}
		</script>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h1>ê²ìí</h1>
						<p>Ipsum dolor sit amet nullam</p>
					</header>

				<!-- Main -->
					<div id="main">

						<!-- Content -->
							<section id="content" class="main">
											<h2>Table</h2>
										<h3>Default</h3>
										<div class="table-wrapper">
											<table>
												<thead>
													<tr>
													<td>
														번호</td>
													<td>작성자</td>
													<td>제목</td>
													<td>작성일</td>
													</tr>
														<tr>
													<td>
														<%=data.getMnum() %></td>
													<td><%=data.getWriter() %></td>
													<td><%=data.getTitle() %></td>
													<td><%=data.getWdate() %></td>
													</tr>
													
												</thead>
												<tbody>
												<tr>
													<td><%=data.getContent() %></td>
												</tr>
										
												
												
												</tbody>
												<tfoot>
												
												<tr><td><a href="control.jsp?action=list" class="button primary">메인페이지</a><td></tr>
												<%  
													if (session.getAttribute("member")!=null){
														MemberVO member = (MemberVO)session.getAttribute("member");
														String writer = member.getMid();
														if (writer.equals(data.getWriter())){
															%>
															
															<tr><td><a href="control.jsp?action=update" class="button primary">수정 및 삭제</a><td></tr>
															
															<%
															
														}
														
													}
												
												%>
													
												</tfoot>
											</table>
										</div>
							</section>

					</div>

				<!-- Footer -->
					<footer id="footer">
						<section>
							<h2>Aliquam sed mauris</h2>
							<p>Sed lorem ipsum dolor sit amet et nullam consequat feugiat consequat magna adipiscing tempus etiam dolore veroeros. eget dapibus mauris. Cras aliquet, nisl ut viverra sollicitudin, ligula erat egestas velit, vitae tincidunt odio.</p>
							<ul class="actions">
								<li><a href="#" class="button">Learn More</a></li>
							</ul>
						</section>
						<section>
							<h2>Etiam feugiat</h2>
							<dl class="alt">
								<dt>Address</dt>
								<dd>1234 Somewhere Road &bull; Nashville, TN 00000 &bull; USA</dd>
								<dt>Phone</dt>
								<dd>(000) 000-0000 x 0000</dd>
								<dt>Email</dt>
								<dd><a href="#">information@untitled.tld</a></dd>
							</dl>
							<ul class="icons">
								<li><a href="#" class="icon brands fa-twitter alt"><span class="label">Twitter</span></a></li>
								<li><a href="#" class="icon brands fa-facebook-f alt"><span class="label">Facebook</span></a></li>
								<li><a href="#" class="icon brands fa-instagram alt"><span class="label">Instagram</span></a></li>
								<li><a href="#" class="icon brands fa-github alt"><span class="label">GitHub</span></a></li>
								<li><a href="#" class="icon brands fa-dribbble alt"><span class="label">Dribbble</span></a></li>
							</ul>
						</section>
						<p class="copyright">&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>