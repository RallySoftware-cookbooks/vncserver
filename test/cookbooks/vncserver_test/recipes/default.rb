# ['buildslave-1', 'analyticsslave-1', 'fooser-5'].each do |username|

#   # user username
#   # vncserver_xstartup username
#   # vncserver_passwd username do
#   #   passwd 'foo'
#   # end

# end

user 'buildslave-1'
vncserver_xstartup 'buildslave-1'
vncserver_passwd 'buildslave-1' do
  passwd 'foo'
end

user 'analyticsslave-1'
vncserver_xstartup 'analyticsslave-1'
vncserver_passwd 'analyticsslave-1' do
  passwd 'foo'
end

user 'fooser-5'
vncserver_xstartup 'fooser-5'
vncserver_passwd 'fooser-5' do
  passwd 'foo'
end

vncserver_servers 'vncservers' do
  server_num 3
  server_names '1:buildslave-1 2:analyticsslave-1 3:fooser-5'
  server_args '-geometry 1280x1024'
end