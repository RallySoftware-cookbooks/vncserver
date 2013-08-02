['buildslave-1', 'analyticsslave-1', 'fooser-5'].each do |username|

  user username
  vncserver_xstartup username
  vncserver_passwd username do
    passwd 'foo'
  end

end

vncserver_servers 'vncservers' do
  server_num 3
  server_names '1:buildslave-1 2:analyticsslave-1 3:fooser-5'
  server_args '-geometry 1280x1024'
end
