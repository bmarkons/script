#!/usr/bin/env ruby

require "script"

Script.define do |s|
  s.step("step 1") do
    puts "Step 1"
    puts "Completed"
    raise
  end

  s.step("step 2") do
    puts "Step 2"
    puts "Completed"
  end
end
