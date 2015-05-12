import time
from fabric.api import run, execute, env, cd

"""
Manage auto-deploy webhooks remotely.

Staging hook:

  forever start -l $HOME/hookshot.log -a deploy/hookshot.js -p 3000 -b staging -c "cd $HOME/staging/current && git pull && bundle exec jekyll build --config _config.yml,_deploy_config.yml >> $HOME/hookshot.log"
  forever restart deploy/hookshot.js -p 3000 -b staging -c "cd $HOME/staging/current && git pull && bundle exec jekyll build --config _config.yml,_deploy_config.yml >> $HOME/hookshot.log"
  forever stop deploy/hookshot.js -p 3000 -b staging -c "cd $HOME/staging/current && git pull && bundle exec jekyll build --config _config.yml,_deploy_config.yml >> $HOME/hookshot.log"

Production hook:

  forever start -l $HOME/hookshot.log -a deploy/hookshot.js -p 4000 -b production -c "cd $HOME/production/current && git pull && bundle exec jekyll build --config _config.yml,_deploy_config.yml >> $HOME/hookshot.log"
  forever restart deploy/hookshot.js -p 4000 -b production -c "cd $HOME/production/current && git pull && bundle exec jekyll build --config _config.yml,_deploy_config.yml >> $HOME/hookshot.log"
  forever stop deploy/hookshot.js -p 4000 -b production -c "cd $HOME/production/current && git pull && bundle exec jekyll build --config _config.yml,_deploy_config.yml >> $HOME/hookshot.log"
"""

# which hook to restart. defaults to staging, override with:
#   fab [command] --set env=production"
environment = env.get('env', 'staging')

port = {
  "staging": 3000,
  "production": 4000
}[environment]

# expects an SSH entry named '18f-site', rather than hardcoded server details
env.use_ssh_config = True
env.hosts = ["18f-site"]

home = "/home/site"
log = "%s/hookshot.log" % home
current = "%s/%s/current" % (home, environment)
ruby = "/opt/install/rbenv/shims/ruby"

# principal command to run upon update
if environment == 'production':
  command = "cd %s && %s go production_build >> %s" % (current, ruby, log)
else:
  command = "cd %s && %s go server_build >> %s" % (current, ruby, log)

## can be run on their own

def start():
  with cd(current):
    run(
      "forever start -l %s -a deploy/hookshot.js -p %i -b %s -c \"%s\""
      % (log, port, environment, command)
    )

def stop():
  with cd(current):
    run(
      "forever stop deploy/hookshot.js -p %i -b %s -c \"%s\""
      % (port, environment, command)
    )

def restart():
  with cd(current):
    run(
      "forever restart deploy/hookshot.js -p %i -b %s -c \"%s\""
      % (port, environment, command)
    )

def update_data():
  with cd(current):
    run("%s go update_submods" % (ruby))
    run("%s go update_data" % (ruby))

def update_submods():
  with cd(current):
    run("%s go update_submods" % (ruby))

def build(scope = ''):
  with cd(current):
    if scope == 'full':
      run("%s go server_build" % (ruby))
    else:
      run('%s go build' % (ruby))
