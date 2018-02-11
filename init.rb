%w(rubygem/lib rubygem/ext gems).each do |subdir|
  dir = File.join(__dir__, subdir)
  $LOAD_PATH.unshift(dir) unless $LOAD_PATH.include?(dir)
end

require 'rust_example'
