ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.

# require 'rubygems'
# require 'rails/commands/server'


# module Rails
#     class Server
#         alias :default_options_alias :default_options
#         def default_options
#             default_options_alias.merge!(:Host => '127.0.0.1')
#         end
        
#     end
# end