var express = require('express');
var app = express();
var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
require('es6-promise').polyfill();
require('isomorphic-fetch');

var mustacheExpress = require('mustache-express');

// Register '.ms' extension with The Mustache Express
app.engine('ms', mustacheExpress());
app.set('view engine', 'ms');
app.set('views', __dirname + '/views');

/** Environment variables **/
var port = process.env.PORT || 3004;
var apihost = process.env.APIHOST || "http://localhost:8000/";

var path = require('path');
var ftwebservice = require('express-ftwebservice');
ftwebservice(app, {
	manifestPath: path.join(__dirname, 'package.json'),
	about: {
		"systemCode": "hackday-luke",
		"name": "Hackday Project 2016",
		"audience": "B2B",
		"serviceTier": "bronze",
	},

	// Also pass good to go.	If application is healthy enough to return it, then it can serve traffic.
	goodToGoTest: function() {
		return new Promise(function(resolve, reject) {
			resolve(true);
		});
	},

	healthCheck: function() {
		return new Promise(function(resolve, reject) {

			fetch(apihost+"__gtg").then(function(apiresponse) {
				resolve([{
					id: 'running',
					name: "App Running",
					ok: true,
					severity: 1,
					businessImpact: "Can't view hackday project",
					technicalSummary: "App isn't running",
					panicGuide: "Start App",
					lastUpdated: new Date().toISOString(),
				},{
					id: 'api-connection',
					name: "Can Connect to API",
					ok: (apiresponse.status == 200),
					severity: 1,
					businessImpact: "Hackday demo won't work.",
					technicalSummary: "Can't connect to `hackday-sarah`",
					panicGuide: "Look for problems with the `hackday-sarah` API.  Check connectivity between this app and "+apihost,
					output: apiresponse.status,
					lastUpdated: new Date().toISOString(),
				}]);
			});
		});
	}
});

app.get('/', function (req, res) {
	if (req.query.orgid) {
		var widgeturl = req.protocol+"://"+req.get("host")+"/org/"+encodeURIComponent(req.query.orgid);
		res.render('index', {widgeturl: widgeturl});
	} else {
		res.render('index');
	}
});

function enhanceStory(story) {
	if (story.id) {
		story.url = "https://www.ft.com/content/"+story.id;
	}
	if (story.image) {
		story.image = "https://image.webservices.ft.com/v2/images/raw/"+encodeURIComponent(story.image)+"?source=hackday-luke&width=200&dpr=2";
	}
}
app.get('/org/:orgid', function (req, res) {
	fetch(apihost+"organisations/"+encodeURIComponent(req.params.orgid)).then(function(response) {
		if (response.status >= 400) {
			throw new Error("Received "+response.status+" response from API");
		}
		return response.json();
	}).then(function (body) {
		body.storyLists = [
			{
				"listTitle": "Stories about "+body.title,
				"stories": body.stories,
			},
			{
				"listTitle": "Stories from Subsidiaries",
				"stories": body.subsidiaryStories,
			},
			{
				"listTitle": "Stories from "+body.industryClassification,
				"stories": body.industryClassificationStories,
			},
			{
				"listTitle": "Stories related to "+body.title,
				"stories": body.recommendedReadsStories,
			}
		];
		delete body.stories;
		body.storyLists.forEach(function (storyList) {
			if (!storyList.stories) return;
			storyList.hasStories = 1;
			storyList.stories.forEach(enhanceStory);
		});
		res.render('organisation', body);
	}).catch(function (error) {
		if (error.message == "Received 404 response from API"){
			res.status(404).render('error', {message:"Organisation not found."});
		} else {
			console.error(error);
			res.status(500).render('error', {message:"Sorry, an unknown error occurred."});
		}
	})
});

app.use(function(req, res, next) {
	res.status(404).render('error', {message:"Page not found."});
});

app.use(function(err, req, res, next) {
	console.error(err.stack);
	res.status(500);
	if (res.get('Content-Type') && res.get('Content-Type').indexOf("json") != -1) {
		res.send({error: "Sorry, an unknown error occurred."});
	} else {
		res.render('error', {message:"Sorry, an unknown error occurred."});
	}
});

app.listen(port, function () {
	console.log('App listening on port '+port);
});

