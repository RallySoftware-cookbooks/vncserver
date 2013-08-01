action :create do
  create_xstartup_file
  new_resource.updated_by_last_action(true)
end

private

def create_xstartup_file

  username = new_resource.username
  vnc_dir = "/home/#{username}/.vnc"

  directory vnc_dir do
    owner username
    group username
    mode 00755
    action :create
  end

  cookbook_file "#{vnc_dir}/xstartup" do
    owner username
    group username
    mode 00644
    source 'xstartup'
    cookbook 'vncserver'
  end

end

