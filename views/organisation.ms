<!DOCTYPE html>
<html>
  	<head>
		<meta charset="UTF-8">
		<title>Hackday Project</title>
		<meta name=viewport content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://build.origami.ft.com/v2/bundles/css?modules=o-header@^4.0.0,o-buttons@^4.0.0,o-forms@^2.0.3,o-grid@^4.2.1,o-table@^5.0.3,o-date@^2.2.1,o-card@^2.2.3,o-aside-panel@^2.0.3">
		<style type="text/css">
		  	body {
				margin:0;
				font-family: Helvetica,arial,sans-serif;
				font-size: 16px;
				background-color: #f7e9d9
			}
			#content {
				padding: 20px 0;
			}
			.o-aside-panel__header {
				background: none;
			}
			.o-aside-panel__body {
				border-top: 4px solid;
				border-bottom: 4px solid;
				border-color: #9b164f;
			}
  		</style>
  	</head>
	<body>
		<div data-o-component="o-aside-panel" class="o-aside-panel">
			<div class="o-aside-panel__header">
				<div class="ft-widget-regular-header">
					<div class="o-header__logo o-header__logo--ft">
						<a href="https://www.ft.com/" target="__blank">
							<abbr title="Financial Times">FT</abbr>
						</a>
						<h1 class="o-header__title">{{title}}</h1>
					</div>
				</div>
			</div>
			<div class="o-aside-panel__body">
				
				{{#stories}}
					<div class="demo-container demo-container--landscape">
						<div class="o-card o-card--landscape {{#image}}o-card--image-left{{/image}}" data-o-component="o-card">
							{{#image}}
								<div class="o-card__image o-card__image--left">
									<img src="{{image}}" alt="demo image"></img>
								</div>
							{{/image}}
							<div class="o-card__content">
								<div class="o-card__meta">
									{{#tags}}
									<a href="{{url}}" class="o-card__tag" target="__blank">{{label}}</a>
									{{/tags}}
								</div>

								<h2 class="o-card__heading">{{#url}}<a href="{{url}}" target="__blank">{{/url}}{{title}}{{#url}}</a>{{/url}}</h2>

								<p class="o-card__standfirst">{{standfirst}}</p>

								{{#publishedDate}}<time data-o-component="o-date" class="o-date o-card__timestamp" datetime="{{publishedDate}}">{{publishedDate}}</time>{{/publishedDate}}
							</div>

						</div>
					</div>

				{{/stories}}
			</div>
		</div>
		<script src="https://build.origami.ft.com/v2/bundles/js?modules=o-header@^4.0.0,o-buttons@^3.0.3,o-table@^5.0.3,o-date@^2.2.1,o-card@^2.2.3,o-aside-panel@^2.0.3"></script>
	</body>
</html>
