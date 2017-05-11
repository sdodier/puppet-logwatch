require 'spec_helper'

describe 'logwatch', :type => :class do

  let (:facts) { { :osfamily => 'RedHat', :operatingsystem => 'Centos' } }

  it { should contain_class('logwatch::params') }
  it { should contain_class('logwatch::install') }
  it { should contain_class('logwatch::config') }

  it do
    should contain_package('logwatch').with({
      :ensure => 'present',
      :name   => 'logwatch',
    })
  end

  it do
    should contain_file('logwatch.conf').with({
      'ensure' => 'file',
      'path'   => '/etc/logwatch/conf/logwatch.conf',
      'owner'  => 'root',
      'group'  => 'root',
      'mode'   => '0644',
    })
  end

  it do
    should contain_file('ignore.conf').with({
      'ensure' => 'file',
      'path'   => '/etc/logwatch/conf/ignore.conf',
      'owner'  => 'root',
      'group'  => 'root',
      'mode'   => '0644',
    })
  end
end
