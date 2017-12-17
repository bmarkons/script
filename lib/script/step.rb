class Script::Step
  def initialize(headline, block)
    @headline = headline
    @block = block
  end

  def run
    puts "-" * 80
    puts "Started: #{@headline}"
    puts "-" * 80
    puts ""

    @block.call

    puts ""
    puts "-" * 80
    puts "Finished: #{@headline}"
    puts "-" * 80
  end
end
