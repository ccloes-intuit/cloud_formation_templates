#!/usr/bin/env ruby
require 'json'
require 'find'

def valid_json?(file)
  JSON.parse File.read file
rescue JSON::ParserError
end

cfn_template_root = File.expand_path('../../', __FILE__)
error = false

Dir.glob("#{cfn_template_root}/**/*.template").each do |file|
  unless valid_json? file
    puts "THIS FILE CONTAINS INVALID JSON: #{file}"
    error = true
  end
end

exit 1 if error
