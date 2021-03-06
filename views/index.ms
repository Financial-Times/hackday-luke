<!DOCTYPE html>
<html>
  	<head>
		<meta charset="UTF-8">
		<title>Clients in Context</title>
		<meta name=viewport content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://build.origami.ft.com/v2/bundles/css?modules=o-header-services@^1.0.0,o-buttons@^4.0.0,o-forms@^3.2.3,o-grid@^4.2.1,o-table@^5.0.3">
		<style type="text/css">
		  	body {
				margin:0;
				font-family: Helvetica,arial,sans-serif;
				font-size: 16px;
			}
			#widgeturl {
				font-size: larger;
				margin: 1em 0;
			}
			#widgeturl a {
				font-size: larger;
				display: block;
				font-family: monospace;
				border: ridge #ccc;
				text-align: center;
				padding: 0.5em;
			}
  		</style>
  	</head>
	<body>
		<header class="o-header-services o-header-services--b2b" data-o-component="o-header">
			<div class="o-header-services__top o-header-services__container">
				<div class="o-header-services__ftlogo"></div>
				<div class="o-header-services__title">
					<h1 class="o-header-services__product-name"><a href="/">Clients in Context</a></h1>
				</div>
			</div>
		</header>
		<div id='content' class="o-grid-container">
			<div class="o-grid-row" data-o-grid-colspan="9">
				{{#widgeturl}}
					<div id="widgeturl">
						The URL of the widget for your B2B customer to embed:
						<a href="{{widgeturl}}">{{widgeturl}}</a>
					</div>
					<form action="/" method="get">
						<input type="submit" class="o-buttons o-buttons--standout o-buttons--b2b" value="Create another Widget" />
					</form>
				{{/widgeturl}}
				{{^widgeturl}}
					<h1>Generate new B2B Widget</h1>
					<form action="/" method="get">
						<div class="o-forms">
							<label for="o-forms-standard" class="o-forms__label">Organisation ID</label>
							<small class="o-forms__additional-info">The UUID for the organisation you want to create a widget for.</small>
							<input type="text" id="orgid" name="orgid" placeholder="abcd-1234-abcd-5678" class="o-forms__text" required></input>
						</div>
						<input type="submit" class="o-buttons o-buttons--standout o-buttons--b2b" value="Generate Widget" />
					</form>
				{{/widgeturl}}
				<div style="margin-top: 3em">
					<h3>Example widgets</h3>
					<ul>
						<li><a href="/?orgid=a14bcf4b-556d-31a6-8bbc-3d53d0366999">Agropur</a></li>
						<li><a href="/?orgid=296db2c2-2c98-3e47-8e2a-e85bdfc1beae">Ferrovial</a></li>
						<li><a href="/?orgid=013f7fa7-aa26-3e20-84f1-fb8e5f7383ff">Barclays</a></li>
					</ul>
				</div>
			</div>
		</div>
		<script src="https://build.origami.ft.com/v2/bundles/js?modules=o-header@^4.0.0,o-buttons@^3.0.3,o-forms@^3.2.3,o-table@^5.0.3"></script>
	</body>
</html>
