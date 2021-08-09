#
# Cookbook:: demo-windows
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'demo-windows::windows' do
  context 'When all attributes are default, on Windows 2012R2' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'windows', '2012R2'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    
    it 'creates test directory' do
      expect(chef_run).to create_directory('C:/test')
    end
  end
  
  context 'When all attributes are default, on Windows 2016' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'windows', '2016'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    
    it 'creates test directory' do
      expect(chef_run).to create_directory('C:/test')
    end
  end
end
