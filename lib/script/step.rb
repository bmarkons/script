class Script::Step
  def initialize(headline, block)
    @headline = headline
    @block = block
  end

  def run
    started_output
    execute_block ? succeded_output : failed_output
  end

  private

  def started_output
    puts ("-" * 80).colorize(:yellow)
    puts "Started: #{@headline}".colorize(:yellow)
    puts ("-" * 80).colorize(:yellow)
    puts ""
  end

  def succeded_output
    puts ""
    puts ("-" * 80).colorize(:green)
    puts "Succeded: #{@headline}".colorize(:green)
    puts ("-" * 80).colorize(:green)
  end

  def failed_output
    puts ""
    puts ("-" * 80).colorize(:red)
    puts "Failed: #{@headline}".colorize(:red)
    puts ("-" * 80).colorize(:red)
  end

  def execute_block
    @block.call
    true
  rescue
    false
  end
end
