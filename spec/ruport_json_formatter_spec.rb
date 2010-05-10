require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe RuportJsonFormatter do
  before(:each) do
    @columns = %w{name age birthyear movie},
    @data = [
      ["doug", 37, 72, "Holy Grail"],
      ["cathy", 39, 71, 'Three "Little" Men'], # try something with a quote in it
      ["connor", 8, 02, "Life of Brian, The"], # try something with a comma in it
      ["tommy", 39, 03, "King's Ransome"] # try something with an apostrophe in in
    ]
    @table  = Ruport::Data::Table.new(:column_names => @column_names, :data => @data)
  end

  it "should be able to spit out JSON" do
    lambda{@table.as(:json).should_not be_nil}.should_not raise_error
  end

  it "should spit out valid json" do
    lambda{JSON.parse(@table.as(:json))}.should_not raise_error
  end
end