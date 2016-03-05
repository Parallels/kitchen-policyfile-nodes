# -*- encoding: utf-8 -*-
#
# Author:: Andrei Skopenko (<andrei@skopenko.net>)
#
# Copyright 2015 Andrei Skopenko
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

require 'kitchen/provisioner/policyfile_zero'
require 'kitchen/provisioner/base'
require 'kitchen/provisioner/chef_zero'

module Kitchen
  module Provisioner

=begin
    class Base

      # PolicyfileNodes needs to access the base behavior of creating the
      # sandbox directory without invoking the behavior of
      # PolicyfileZero#create_sandbox, we need to override json node.
      alias_method :call_chef, :call
    end
=end

    class Base
      # Runs the provisioner on the instance.
      #
      # @param state [Hash] mutable instance state
      # @raise [ActionFailed] if the action could not be completed
      def call(state)
        create_sandbox
        sandbox_dirs = Dir.glob(File.join(sandbox_path, '*'))

        instance.transport.connection(state) do |conn|
          conn.execute(install_command)
          conn.execute(init_command)
          info("Transferring files to #{instance.to_str}")
          conn.upload(sandbox_dirs, config[:root_path])
          debug('Transfer complete')
          conn.execute(prepare_command)
          conn.execute(run_command)
          save_node
        end
      rescue Kitchen::Transport::TransportFailed => ex
        raise ActionFailed, ex.message
      ensure
        cleanup_sandbox
      end
    end

    class PolicyfileZero

      # PolicyfileNodes needs to access the base behavior of creating the
      # sandbox directory without invoking the behavior of
      # PolicyfileZero#create_sandbox, we need to override json node.
      alias_method :create_policyfile_sandbox, :create_sandbox
    end

    class PolicyfileNodes < PolicyfileZero

      # (see PolicyfileZero#create_sandbox)
      def create_sandbox
        FileUtils.rm(node_file) if File.exist?(node_file)
        create_policyfile_sandbox
      end

      def node_file
        File.join(config[:nodes_path], "#{instance.name}.json")
      end



      # Stub save node for PolicyfileNodes inheritance
      def save_node
        pp node_file
        # instance.instance_variables
        #suite_node = JSON.parse(File.read('/Users/ascopenco/test/node.json'))
        #File.open(json_file, 'w') do |file|
        #  file.write(JSON.pretty_generate(suite_node))
        #end
      end
    end
  end
end
