/**
 * Cloud Pages automatically provides the $BRANCH
 * env variable with the git branch name in any of its
 * built environments.
 * If we are in Cloud Pages and building from the main branch,
 * we will set production to true.
 * For local dev, we can use NODE_ENV=production
 * to force production to true.
 */
module.exports = {
  production: process.env.NODE_ENV === 'production' || process.env.BRANCH === 'main',
};
