action :create do
  create_passwd_file
  new_resource.updated_by_last_action(true)
end

private

def create_passwd_file

  username = new_resource.username
  passwd = new_resource.passwd

  vnc_dir = "/home/#{username}/.vnc"

  execute "create vnc password file for #{username}" do
    command "sudo su - #{username} -c \"echo '#{passwd}' | vncpasswd -f > .vnc/passwd\""
    not_if "sudo su - #{username} -c \"test -f .vnc/passwd\""
  end

  file "#{vnc_dir}/passwd" do
    owner username
    group username
    mode '0600'
    action :touch
  end
end

