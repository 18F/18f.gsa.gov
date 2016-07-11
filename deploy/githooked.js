#!/usr/bin/env node

var githooked = require("githooked"),
    program   = require("commander");

program
  .option("-b, --branch <branch>", "Git branch to use when waiting for posthooks")
  .option("-c, --command <command>", "Command to run after posthook.")
  .option("-p, --port <number>", "Port in which to watch for postcommit web hooks.")
  .parse(process.argv);

if (!program.branch || !program.command || !program.port) {
  console.error("--branch, --command, and --port are all required.");
  program.outputHelp();
  process.exit(1);
}

// Create githooked server
githooked("refs/heads/" + program.branch, program.command).listen(program.port, function() {
  console.log("Huzzah! Listening on port " + program.port + " for push events on " + program.branch + ".");
});
