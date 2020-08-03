def run_cmd(cmd)
  # http://stackoverflow.com/a/2225391/358804
  unless system(cmd)
    raise "Non-zero exit status for `#{cmd}`"
  end
end
