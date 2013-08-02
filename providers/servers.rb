action :create do
  create_vncservers_file
  new_resource.updated_by_last_action(true)
end

private

def create_vncservers_file

  server_num = new_resource.server_num
  server_names = new_resource.server_names
  server_args = new_resource.server_args

  template '/etc/sysconfig/vncservers' do
    source 'vncservers.erb'
    owner 'root'
    group 'root'
    mode 00644
    cookbook 'vncserver'
    variables({
      :server_num => server_num,
      :server_names => server_names,
      :server_args => server_args
    })
  end

  service 'vncserver' do
    action :start
  end

end
