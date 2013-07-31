require_relative 'spec_helper'

describe package('tigervnc-server') do
  it { should be_installed }
end

describe file('/etc/sysconfig/vncservers') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
