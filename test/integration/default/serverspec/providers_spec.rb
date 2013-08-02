require_relative 'spec_helper'

describe 'vncserver_test' do

  ['buildslave-1', 'analyticsslave-1', 'fooser-5'].each do |username|

    describe user(username) do
      it { should exist }
    end

    describe file("/home/#{username}/.vnc") do
      it { should be_directory }
      it { should be_owned_by username }
      it { should be_grouped_into username }
      it { should be_mode '755' }
    end

    describe file("/home/#{username}/.vnc/xstartup") do
      it { should be_file }
      it { should be_owned_by username }
      it { should be_grouped_into username }
      it { should be_mode '644' }
    end

    describe file("/home/#{username}/.vnc/passwd") do
      it { should be_file }
      it { should be_owned_by username }
      it { should be_grouped_into username }
      it { should be_mode '600' }
    end

  end

end
