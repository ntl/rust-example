require_relative '../init'

bench_lib_dir = File.join(__dir__, 'bench', 'lib')
$LOAD_PATH.unshift(bench_lib_dir) unless $LOAD_PATH.include?(bench_lib_dir)

require 'test_bench/activate'
