# -*- encoding: utf-8 -*-

require "kitchen/provisioner/policyfile_zero"
require "kitchen/provisioner/base"

module Kitchen

  module Provisioner

    class Base

      # Runs the provisioner on the instance.
      #
      # @param state [Hash] mutable instance state
      # @raise [ActionFailed] if the action could not be completed
      def call(state)
        create_sandbox
        sandbox_dirs = Dir.glob(File.join(sandbox_path, "*"))

        instance.transport.connection(state) do |conn|
          conn.execute(install_command)
          conn.execute(init_command)
          info("Transferring files to #{instance.to_str}")
          conn.upload(sandbox_dirs, config[:root_path])
          debug("Transfer complete")
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

    class PolicyfileNodes < PolicyfileZero

      # Stub save node for PolicyfileNodes inheritance
      def save_node
        json_file = File.join(config[:nodes_path], "#{instance.name}.json")
        pp json_file
        #instance.instance_variables
        #suite_node = JSON.parse(File.read('/Users/ascopenco/test/node.json'))
        #File.open(json_file, 'w') do |file|
        #  file.write(JSON.pretty_generate(suite_node))
        #end
      end

    end
  end
end
