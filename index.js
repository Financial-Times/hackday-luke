var express = require('express');
var app = express();
var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));


var mustacheExpress = require('mustache-express');

// Register '.ms' extension with The Mustache Express
app.engine('ms', mustacheExpress());
app.set('view engine', 'ms');
app.set('views', __dirname + '/views');

/** Environment variables **/
var port = process.env.PORT || 3004;

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
		return [{
			id: 'running',
			name: "App Running",
			ok: true,
			severity: 1,
			businessImpact: "Can't view results",
			technicalSummary: "App isn't running",
			panicGuide: "Start App",
			checkOutput: output,
			lastUpdated: new Date().toISOString(),
		}];
	}
});

app.get('/', function (req, res) {
	res.render('index', {
	});
});
app.get('/org/:orgid', function (req, res) {
	var testdata = {
		title: "Test Org",
		description: "Special Stuff",
		stories: [
			{
				heading: "Headline 1",
				standfirst: "Stuff about this Story.",
				timestamp: "2016-02-29T12:35:48Z",
				tags: [
					{
						url: "https://www.ft.com/topics/places/Saudi_Arabia",
						label: "Saudi Arabia",
					}
				],
				image: "http://im.ft-static.com/content/images/a60ae24b-b87f-439c-bf1b-6e54946b4cf2.img",
			},
			{
				heading: "No image",
				standfirst: "Text all the way.",
				timestamp: "2016-09-29T14:35:48Z",
				tags: [
					{
						url: "https://www.ft.com/topics/places/Saudi_Arabia",
						label: "Saudi Arabia",
					}
				]
			},
			{
				heading: "Multitags",
				standfirst: "Metadata is fun.",
				timestamp: "2016-09-29T14:35:48Z",
				tags: [
					{
						url: "https://www.ft.com/stream/topicsId/MTk2YmJiYzgtNTkzNi00ZjZhLWE1NzAtNTQ3MTY0NTNjZDA1-VG9waWNz",
						label: "Global economic growth",
					},
					{
						url: "https://www.ft.com/topics/places/Saudi_Arabia",
						label: "Saudi Arabia",
					},
				],
				image: "http://prod-upp-image-read.ft.com/2b5c8f2c-a287-11e6-aa83-bcb58d1d2193",
			}
		],
	};

	testdata.stories.forEach(function (story){
		if (story.uuid) {
			story.url = "https://www.ft.com/content/"+story.uuid;
		}
		if (story.image) {
			story.image = "https://image.webservices.ft.com/v1/images/raw/"+encodeURIComponent(story.image)+"?source=hackday-luke";
		}
	});
	res.render('organisation', testdata);
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

