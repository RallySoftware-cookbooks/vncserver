require_relative 'spec_helper'

describe 'passwd provider' do

  let(:chef_run) do
    ChefSpec::ChefRunner.new(:step_into => ['vncserver_passwd'])
  end

  subject { chef_run.converge 'vncserver_test::default' }

  ['buildslave-1', 'analyticsslave-1', 'fooser-5'].each do |username|

    it { should create_user username }

    it 'should create vnc passwd file' do
      file = subject.file("/home/#{username}/.vnc/passwd")
      file.mode.should == 00600
      expect(file).to be_owned_by(username, username)
    end

  end

end
