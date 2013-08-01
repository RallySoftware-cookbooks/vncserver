['buildslave-1', 'analyticsslave-1', 'fooser-5'].each do |username|
  user username

  vncserver_xstartup username

  # vncserver_passwd username do
  #   username "foo"
  # end

end
