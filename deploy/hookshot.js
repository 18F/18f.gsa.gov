#!/usr/bin/env node

var hookshot = require("hookshot");

// TODO: hard to use this in dev, would be nice to factor this out somewhere
var staging = "/home/site/staging/current";
var production = "/home/site/production/current";
var command = "git pull > deploy/hookshot.log";

// debug - uncomment for dev, comment before committing (great practice, I know)
// staging = "/home/eric/18f/18f.gsa.gov"
// command = "git pull >> deploy/hookshot.log"


// adapted from https://github.com/coreh/hookshot/blob/master/lib/index.js#L36-L46
var spawn = require("child_process").spawn;
function execute(action) {
  spawn(process.env.SHELL, ['-c', action], { stdio: 'inherit' });
}

hookshot()
.on('push', function(info) {

  console.log('incoming push: ' + info.ref);

  if (info.ref == "refs/heads/staging")
    execute("cd " + staging + " && " + command);
  else if (info.ref == "refs/heads/master")
    execute("cd " + production + " && " + command);
})
.listen(3000);

console.log("Huzzah! Listening on port 3000 for push events.")
