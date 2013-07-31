require_relative 'spec_helper'

describe 'vncserver::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'vncserver::default' }
  it 'should do something'
end
