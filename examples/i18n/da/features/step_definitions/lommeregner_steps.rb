begin
  require 'rspec/expectations'
rescue LoadError
  require 'spec/expectations'
end

require 'cucumber/formatter/unicode'
$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../../lib")
require 'lommeregner'

Before do
  @calc = Lommeregner.new
end

After do
end

Given(/at jeg har indtastet (\d+)/) do |n|
  @calc.push n.to_i
end

When('jeg lægger sammen') do
  @result = @calc.add
end

Then(/skal resultatet være (\d*)/) do |result|
  expect(@result).to eq(result.to_f)
end
