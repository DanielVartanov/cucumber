require 'spec/expectations'

World do
  Object.new
end

After do |scenario|
  if scenario.status.index(:failed)
    # Call the BDD police
  end
end

Given "be_empty" do
  [1,2].should_not be_empty
end

Given "nested step is called" do
  Given "I like mushroom", Cucumber::Ast::Table.new([
    %w{sponge bob},
    %w{is cool}
  ])
end

Given 'nested step is called using text table' do
  Given "I like mushroom", table(%{
    | sponge | bob  |
    | is     | cool |
  })

  # Alternative syntax (file and line will be reported on parse error)
  # Given "I like mushroom", table(<<-EOT, __FILE__, __LINE__)
  #   | sponge | bob  |
  #   | is     | cool
  # EOT
end

Given "I like $what" do |what, table|
  @magic = what
  @tool  = table.raw[0][0]
end

Then "nested step should be executed" do
  @magic.should == 'mushroom'
  @tool.should == 'sponge'
end

Given /^the following table$/ do |table|
  @table = table
end

Then /^I should be (\w+) in (\w+)$/ do |key, value|
  hash = @table.hashes[0]
  hash[key].should == value
end

Then /^I shoule see a multiline string like$/ do |s|
  s.should == %{A string
that spans
several lines}
end
