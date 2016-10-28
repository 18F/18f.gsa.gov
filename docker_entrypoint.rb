require 'etc'

# We want our Docker process to use the same uid as the owner of the
# repository checkout. This will ensure that any created files
# have the same owner and can be accessed on the host system, rather than
# being owned by root and hard to modify or delete.
HOST_UID = File::Stat.new('/app').uid

# This is just the username for the uid, for cosmetic purposes only really.
HOST_USER = '18f_user'.freeze

def does_username_exist(username)
  Etc.getpwnam(username)
  true
rescue ArgumentError
  false
end

def does_uid_exist(uid)
  Etc.getpwuid(uid)
  true
rescue ArgumentError
  false
end

def assume_uid
  unless does_uid_exist(HOST_UID)
    username = HOST_USER
    username += '0' while does_username_exist(username)
    home_dir = '/home/' + username
    system("useradd -d #{home_dir} -m #{username} -u #{HOST_UID}")
  end
  ENV['HOME'] = '/home/' + Etc.getpwuid(HOST_UID).name
  Process::UID.change_privilege(HOST_UID)
  return unless Process.euid != HOST_UID
end

assume_uid

exec(*ARGV)
