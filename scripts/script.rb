#!/usr/bin/env ruby

require "script"

Script.define do |s|
	s.step("setup") do
		system("bundle install") 
	end

	s.step("build") do
		system("bundle exec rake spec")
	end

	s.step("deploy") do
		system("gem push script-*")
	end
end

