<!DOCTYPE html>
<html>
  	<head>
		<meta charset="UTF-8">
		<title>Hackday Project</title>
		<meta name=viewport content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://build.origami.ft.com/v2/bundles/css?modules=o-header-services@^1.0.0,o-buttons@^4.0.0,o-forms@^2.0.3,o-grid@^4.2.1,o-table@^5.0.3,o-date@^2.2.1,o-card@^2.2.3">
		<style type="text/css">
		  	body {
				margin:0;
				font-family: Helvetica,arial,sans-serif;
				font-size: 16px;
			}
			#content {
				padding: 20px 0;
			}
  		</style>
  	</head>
	<body>
		<header class='o-header-services' data-o-component='o-header-services'>
			<div class='o-header-services__top o-header-services__container'>
				<a href="/" class='o-header-services__ftlogo'></a>
				<div class='o-header-services__title'>
					<h1 class='o-header-services__product-name'>Hackday Project</h1>
					<span class='o-header-subrand__product-tagline'>Awaiting Name</span>
				</div>
			</div>
		</header>
		<div id='content' class="o-grid-container">
			<div class="o-grid-row" data-o-grid-colspan="9">
				<h1>{{title}}</h1>
				<div class="description">{{description}}</div>
				{{#stories}}
					<div class="demo-container demo-container--landscape">
						<div class="o-card o-card--landscape o-card--image-left" data-o-component="o-card">
							{{#image}}
								<div class="o-card__image o-card__image--left">
									<img src="{{image}}" alt="demo image"></img>
								</div>
							{{/image}}
							<div class="o-card__content">
								<div class="o-card__meta">
									{{#tags}}
									<a href="{{url}}" class="o-card__tag">{{label}}</a>
									{{/tags}}
								</div>

								<h2 class="o-card__heading">{{#url}}<a href="{{url}}">{{/url}}{{heading}}{{#url}}</a>{{/url}}</h2>

								<p class="o-card__standfirst">{{standfirst}}</p>

								{{#timestamp}}<time data-o-component="o-date" class="o-date o-card__timestamp" datetime="{{timestamp}}">{{timestamp}}</time>{{/timestamp}}
							</div>

						</div>
					</div>

				{{/stories}}
			</div>
		</div>
		<script src="https://build.origami.ft.com/v2/bundles/js?modules=o-header@^4.0.0,o-buttons@^3.0.3,o-table@^5.0.3,o-date@^2.2.1,o-card@^2.2.3"></script>
	</body>
</html>
