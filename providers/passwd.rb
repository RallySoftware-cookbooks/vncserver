action :create do
  create_passwd_file
  new_resource.updated_by_last_action(true)
end

private

def create_passwd_file

  username = new_resource.username
  passwd = new_resource.passwd

  vnc_dir = "/home/#{username}/.vnc"

  execute "sudo su - #{username} -c \"echo '#{passwd}' | vncpasswd -f > .vnc/passwd\""

  file "#{vnc_dir}/passwd" do
    owner username
    group username
    mode '0600'
    action :touch
  end

end

