require_relative 'spec_helper'

describe package('tigervnc-server') do
  it { should be_installed }
end

describe service('vncserver') do
  it { should be_enabled }
end
