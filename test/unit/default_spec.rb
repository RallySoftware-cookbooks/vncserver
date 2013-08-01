require_relative 'spec_helper'

describe 'vncserver::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new() }

  subject { chef_run.converge 'vncserver::default' }
  it { should install_package 'tigervnc-server' }

  it 'should setup vncservers file if setup is set to true' do
    # chef_run.node.set['vncserver']['vncservers_file']['setup'] = true
    # expect(chef_run).to create_file_with_content('/etc/sysconfig/vncservers', /VNCSERVERS/)
    chef_run.converge 'vncserver::default'

    file = chef_run.template('/etc/sysconfig/vncservers')
    expect(file.mode).to eq('644')
    expect(file.owner).to eq('root')
    expect(file.group).to eq('root')
  end

end

