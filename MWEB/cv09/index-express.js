var express = require('express');
var Enum = require('enum');
var mongodb = require('mongodb')
var MongoClient = require('mongodb').MongoClient,
    assert = require('assert');
var moment = require('moment');

var bodyParser = require('body-parser');
var app = express();
var mongo_url = 'mongodb://172.17.0.2:27017/mweb-logging';
var port = 3000;
var enumLogTypes = new Enum(["warn", "info", "ok"]);
var enumLogStatusTypes = new Enum(["accepted", "failed"]);
var path = __dirname + '/views/';



var insertDocuments = function(db, callback, data) {
    // Get the documents collection
    var collection = db.collection('logs');
    // Insert some documents
    collection.insert(data, function(err, result) {
        console.log("Inserted 1 log");
        callback(result);
    });
}

var createValidated = function(db, callback) {
    db.createCollection("logs", {
            'validator': {
                '$and': [{
                        'date': {
                            '$type': "date",
                            '$exists': true
                        }
                    },
                    {
                        'message': {
                            '$type': "string",
                            '$exists': true
                        }
                    },
                    {
                        'type': {
                            '$in': ["ok", "warn", "info"],
                            '$exists': true
                        },

                    }
                ]
            }
        },
        function(err, results) {
            console.log("Collection created.");
            callback();
        }
    );
};

function handlePost(req, db) {
    console.log(req.params)
    var logType = req.param('type');
    var message = req.param('message');
    var timestamp = new Date();
    var errMessage;
    if (!(logType && message)) {
        errMessage = "Not enough data. Make sure that `type` and `message` fields are included";
        return makeStatusMessage(enumLogStatusTypes.failed, errMessage);
    }
    var enumLogType = enumLogTypes.get(logType.toLowerCase());
    if (!enumLogType) {
        errMessage = "Unknown log type. Available types are: " + enumLogTypes.enums.map(x => x.key).join();
        return makeStatusMessage(enumLogStatusTypes.failed, errMessage);
    }
    var obj = {}
    obj["type"] = enumLogType.key;
    obj["message"] = message;
    obj["date"] = timestamp;

    insertDocuments(db, function() {}, obj);

    return makeStatusMessage(enumLogStatusTypes.accepted, null);
}


function deleteLog(req, res, db) {
    var log_id = req.body.id;
    console.log("Deleting log " + log_id);
    var query = {"_id" : new mongodb.ObjectID(log_id)}
    db.collection('logs').deleteOne(query, function(err, obj){
        if (err) return res.send(JSON.stringify({"status": false}));
        else return res.send(JSON.stringify({"status": true}));
    });

}


function makeStatusMessage(type, message) {
    var data = {}
    data["status"] = type.key;
    if (message) {
        data["message"] = message
    }
    return JSON.stringify(data);
}

function getLogs(db, res) {
    console.log("Getting logs")
    db.collection('logs').find().sort({"date" : -1}).toArray(function(err, results) {
        // send HTML file populated with quotes here
        res.send(JSON.stringify(results));
    })
}

function start(port, db) {
    app.use(bodyParser.json()); // support json encoded bodies
    app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies

    // routování
    app.get('/', function(req, res) {
        res.send("Hello world!");
    });
    app.get('/post-log', function(req, res) {
        res.send(handlePost(req, db));
    });

    app.get('/list-log', function(req, res) {
        getLogs(db, res);
    });

    app.post('/delete', function(req, res){
        deleteLog(req, res, db);
    });

    app.get('/admin', function(req, res) {
        db.collection('logs').find().toArray(function(err, results) {

            // send HTML file populated with quotes here
            res.render(path + 'admin.ejs', {
                logs: results,
                moment: moment
            });
        })
    });

    // šablony
    app.set('view engine', 'ejs');
    app.set('views', './views');

    app.listen(port);
}



MongoClient.connect(mongo_url, function(err, db) {
    assert.equal(null, err);
    createValidated(db, function() {});
    start(port, db);

});
