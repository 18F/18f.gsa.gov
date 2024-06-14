const {execSync} = require('child_process');

// Lists files that have been modified since the last commit
// Used in local development, to check accessibility prior to
// committing changes
class Differ {
  command = 'git ls-files --modified';

  changedFiles() {
    return String(execSync(this.command)).split(/\n/).filter(x => x !== '')
  }
}

module.exports = {
  Differ,
}
