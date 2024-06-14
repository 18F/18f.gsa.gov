const { Differ } = require('./differ');

// Lists files that were modified in the last commit
// Used for CI pa11y checks, to check the last commit
class CommitDiffer extends Differ {
  command = 'git diff-tree --no-commit-id --name-only -r $(git rev-parse HEAD)';
}

module.exports = {
  CommitDiffer,
}
