require_relative 'spec_helper'

describe 'vnc_xstartup provider' do

  let(:chef_run) do
    ChefSpec::ChefRunner.new(:step_into => ['vncserver_xstartup'])
  end

  subject { chef_run.converge 'vncserver_test::default' }

  ['buildslave-1', 'analyticsslave-1', 'fooser-5'].each do |username|

    it { should create_user username }

    it 'should create .vnc directory' do
      dir = subject.directory("/home/#{username}/.vnc")
      expect(dir.mode).to eq(00755)
      expect(dir).to be_owned_by(username, username)
    end

    it 'should create vnc xstartup file' do
      file = subject.cookbook_file("/home/#{username}/.vnc/xstartup")
      expect(file.mode).to eq(00644)
      expect(file).to be_owned_by(username, username)
    end

    it { should create_file_with_content("/home/#{username}/.vnc/xstartup", /vncconfig/) }

  end

end
