require_relative 'spec_helper'

describe package('tigervnc-server') do
  it { should be_installed }
end
