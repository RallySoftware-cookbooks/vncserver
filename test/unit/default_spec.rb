require_relative 'spec_helper'

describe 'vncserver::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new() }

  subject { chef_run.converge 'vncserver::default' }

  it { should install_package 'tigervnc-server' }

  it 'should create vncservers file' do
    file = subject.template('/etc/sysconfig/vncservers')
    expect(file.mode).to eq('644')
    expect(file).to be_owned_by('root', 'root')
  end

  it { should create_file_with_content('/etc/sysconfig/vncservers', /VNCSERVERS/) }

end
