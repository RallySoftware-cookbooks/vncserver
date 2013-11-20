require_relative 'spec_helper'

describe 'passwd provider' do

  let(:chef_run) do
    ChefSpec::Runner.new(:step_into => ['vncserver_passwd']).converge 'vncserver_test::default'
  end

  subject { chef_run }

  ['buildslave-1', 'analyticsslave-1', 'fooser-5'].each do |username|

    it { should create_user username }

    describe 'creates vnc passwd file' do
      subject { chef_run.file("/home/#{username}/.vnc/passwd") }
      its(:owner) { should be_eql username }
      its(:group) { should be_eql username }
      its(:mode) { should be_eql '0600' }
    end

  end

end
