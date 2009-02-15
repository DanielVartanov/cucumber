# encoding: utf-8
require 'spec/expectations'
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'cucumber/formatters/unicode'
require 'calculator'

Before do
  @calc = Calculator.new
end

After do
end

Given /ввёл число (\d+)/ do |n|
  @calc.push n.to_i
end

When /я нажимаю "(.*)"/ do |op|
  @result = @calc.send op
end

Then /должен увидеть на экране число (\d+)/ do |result|
  @result.should == result.to_f
end