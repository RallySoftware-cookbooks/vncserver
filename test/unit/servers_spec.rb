require_relative 'spec_helper'

describe 'servers provider' do

  let(:chef_run) do
    ChefSpec::Runner.new(:step_into => ['vncserver_servers']).converge 'vncserver_test::default'
  end

  subject { chef_run }

  describe 'creates vncservers file' do
    subject { chef_run.template('/etc/sysconfig/vncservers') }
    its(:owner) { should be_eql 'root' }
    its(:group) { should be_eql 'root' }
    its(:mode) { should be_eql '0644' }
  end

  it { should render_file("/etc/sysconfig/vncservers").with_content(/buildslave\-1/) }

  it { should start_service 'vncserver' }

end
