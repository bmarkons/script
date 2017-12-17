#!/usr/bin/env ruby

require "script"

script = Script.new

script.step("step 1") do
  puts "Step 1"
  puts "Completed"
  raise
end

script.step("step 2") do
  puts "Step 2"
  puts "Completed"
end

script.run
