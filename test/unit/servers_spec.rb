require_relative 'spec_helper'

describe 'servers provider' do

  let(:chef_run) do
    ChefSpec::ChefRunner.new(:step_into => ['vncserver_servers'])
  end

  subject { chef_run.converge 'vncserver_test::default' }

  it 'should create vncservers file' do
    file = subject.template('/etc/sysconfig/vncservers')
    file.mode.should == 00644
    expect(file).to be_owned_by('root', 'root')
  end

  it { should create_file_with_content("/etc/sysconfig/vncservers", /buildslave\-1/) }

  it { should start_service 'vncserver' }

end
