require_relative 'spec_helper'

describe 'vncserver::default' do

  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'vncserver::default' }

  it { should install_package 'tigervnc-server' }

  it 'should setup vncservers file if setup is set to true' do
    chef_run.node.set['vncserver']['vncservers_file']['setup'] = true
    chef_run.should create_file '/etc/sysconfig/vncservers'
    chef_run.file('/var/log/bar.log').should be_owned_by('root', 'root')
  end

end
