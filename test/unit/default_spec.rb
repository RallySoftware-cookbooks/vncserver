require_relative 'spec_helper'

describe 'vncserver::default' do

  subject { ChefSpec::Runner.new.converge described_recipe }

  it { should install_package 'tigervnc-server' }
  it { should enable_service 'vncserver' }
  it { should_not start_service 'vncserver' }

end
