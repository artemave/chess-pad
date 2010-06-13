$:.unshift(File.dirname(__FILE__) + '../lib')

require 'pp'

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f}
