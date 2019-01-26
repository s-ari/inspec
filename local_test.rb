describe user('ubuntu') do
  it { should exist }
  its('shell') { should eq '/bin/false' }
end

describe package('wget') do
  it { should be_installed }
end

describe package('ntp') do
  it { should be_installed }
end

describe package('docker-ce') do
  it { should be_installed }
  its('version') { should eq '17.03.1~ce-0~ubuntu-xenial' }
end

describe pip('ansible') do
  it { should be_installed }
  its('version') { should eq '2.3.1.0' }
end

describe processes('ntpd') do
  its('list.length') { should eq 1 }
end

describe processes('dockerd') do
  its('list.length') { should eq 1 }
end

describe port(123) do
  it { should be_listening }
end

describe command('ntpq -p') do
   its('stdout') { should match /^\*/ }
end

