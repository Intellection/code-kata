require 'pry'

Dir["./lib/*.rb"].sort.each do |f|
  require f
end

PROJECT_ROOT = File.expand_path(File.dirname(__FILE__) + '/../')
