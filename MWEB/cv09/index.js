var http = require('http');
var url = require('url');
var Enum = require('enum');
var MongoClient = require('mongodb').MongoClient,
    assert = require('assert');

var mongo_url = 'mongodb://172.17.0.2:27017/mweb-logging';
var port = 3000;
var enumLogTypes = new Enum(["warn", "info", "ok"]);
var enumLogStatusTypes = new Enum(["accepted", "failed"]);


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

function handlePost(request) {
    var _get = url.parse(request.url, true).query;
    var errMessage;
    if (!(_get["type"] && _get["message"])) {
        errMessage = "Not enough data. Make sure that `type` and `message` fields are included";
        return makeStatusMessage(enumLogStatusTypes.failed, errMessage);
    }
    var logType = _get["type"].toLowerCase();
    console.log(logType)
    var enumLogType = enumLogTypes.get(logType);
    if (!enumLogType) {
        errMessage = "Unknown log type. Available types are: " + enumLogTypes.enums.map(x => x.key).join();
        return makeStatusMessage(enumLogStatusTypes.failed, errMessage);
    }
    var message = _get["message"];
    var timestamp = new Date();
    var obj = {}
    obj["type"] = enumLogType.key;
    obj["message"] = message;
    obj["date"] = timestamp;

    MongoClient.connect(mongo_url, function(err, db) {
        assert.equal(null, err);
        insertDocuments(db, function() {
            db.close();
        }, obj);
    });

    return makeStatusMessage(enumLogStatusTypes.accepted, null);
}


function makeStatusMessage(type, message) {
    var data = {}
    data["status"] = type.key;
    if (message) {
        data["message"] = message
    }
    return JSON.stringify(data);
}

function start(port) {
    function onRequest(request, response) {
        var pathname = url.parse(request.url).pathname;
        console.log("Request for " + pathname + " received.");
        var response_text;
        switch (pathname) {
            case "/post-log":
                response_text = handlePost(request)
                break;

            default:
                response_text = "Hello";
        }
        var _get = url.parse(request.url, true).query;
        response.writeHead(200, {
            "Content-Type": "text/plain"
        });
        response.write(response_text);
        response.end();
    }

    http.createServer(onRequest).listen(port);

}

start(port);

console.log("Started server on port " + port);


MongoClient.connect(mongo_url, function(err, db) {
    assert.equal(null, err);
    createValidated(db, function() {
        db.close();
    });
});
