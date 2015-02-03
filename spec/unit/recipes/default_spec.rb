#
# Cookbook Name:: haproxy-ng
# Spec:: default
#
# Copyright 2015 Nathan Williams
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


require 'spec_helper'

describe 'haproxy-ng::default' do

  context 'When all attributes are default, on an unspecified platform' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'includes the install recipe' do
      expect(:chef_run).to include_recipe 'haproxy-ng::install'
    end

    it 'creates haproxy_default HTTP' do
      expect(:chef_run).to create_haproxy_default 'HTTP'
    end

    it 'creates haproxy_backend app' do
      expect(:chef_run).to create_haproxy_backend 'app'
    end

    it 'creates haproxy_frontend www' do
      expect(:chef_run).to create_haproxy_frontend 'www'
    end

    it 'creates haproxy_instance haproxy' do
      expect(:chef_run).to create_haproxy_instance 'haproxy'
    end

    it 'skips validation' do
      expect(:chef_run).to_not run_execute 'validate-haproxy_instance-haproxy'
    end

    it 'includes the service recipe' do
      expect(:chef_run).to include_recipe 'haproxy-ng::service'
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

  end
end
