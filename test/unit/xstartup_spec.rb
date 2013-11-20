require_relative 'spec_helper'

describe 'xstartup provider' do

  let(:chef_run) do
    ChefSpec::Runner.new(:step_into => ['vncserver_xstartup']).converge 'vncserver_test::default'
  end

  subject { chef_run }

  # ['buildslave-1', 'analyticsslave-1', 'fooser-5'].each do |username|
  context 'buildslave-1' do
    let(:username) { 'buildslave-1' }
    let(:vnc_directory) { "/home/#{username}/.vnc" }

    it { should create_user username }

    describe 'creates .vnc directory' do
      subject { chef_run.directory(vnc_directory) }
      its(:owner) { should be_eql username }
      its(:group) { should be_eql username }
      its(:mode) { should be_eql '0755' }
    end

    describe 'creates vnc xstartup file' do
      subject { chef_run.cookbook_file("#{vnc_directory}/xstartup") }
      its(:owner) { should be_eql username }
      its(:group) { should be_eql username }
      its(:mode) { should be_eql '0644' }
    end

    it { should render_file("#{vnc_directory}/xstartup").with_content(/vncconfig/) }
  end

  context 'analyticsslave-1' do
    let(:username) { 'analyticsslave-1' }
    let(:vnc_directory) { "/home/#{username}/.vnc" }

    it { should create_user username }

    describe 'creates .vnc directory' do
      subject { chef_run.directory(vnc_directory) }
      its(:owner) { should be_eql username }
      its(:group) { should be_eql username }
      its(:mode) { should be_eql '0755' }
    end

    describe 'creates vnc xstartup file' do
      subject { chef_run.cookbook_file("#{vnc_directory}/xstartup") }
      its(:owner) { should be_eql username }
      its(:group) { should be_eql username }
      its(:mode) { should be_eql '0644' }
    end

    it { should render_file("#{vnc_directory}/xstartup").with_content(/vncconfig/) }
  end

  context 'fooser-5' do
    let(:username) { 'fooser-5' }
    let(:vnc_directory) { "/home/#{username}/.vnc" }

    it { should create_user username }

    describe 'creates .vnc directory' do
      subject { chef_run.directory(vnc_directory) }
      its(:owner) { should be_eql username }
      its(:group) { should be_eql username }
      its(:mode) { should be_eql '0755' }
    end

    describe 'creates vnc xstartup file' do
      subject { chef_run.cookbook_file("#{vnc_directory}/xstartup") }
      its(:owner) { should be_eql username }
      its(:group) { should be_eql username }
      its(:mode) { should be_eql '0644' }
    end

    it { should render_file("#{vnc_directory}/xstartup").with_content(/vncconfig/) }
  end
end
