require_relative 'spec_helper'

describe 'vncserver::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new() }

  subject { chef_run.converge 'vncserver::default' }

  it { should install_package 'tigervnc-server' }

  it { should set_service_to_start_on_boot 'vncserver' }
  it { should_not start_service 'vncserver' }

end
