module Script::Output
  module_function

  def print_started(step)
    puts separator(:yellow)
    puts "Started: #{@headline}".colorize(:yellow)
    puts ""
  end

  def print_result(step)
    color = :green if step.result == :succeded
    color = :red   if step.result == :failed
    text = "#{step.result.capitalize}: #{step.headline}"

    puts ""
    puts text.colorize(color)
    puts separator(color)
  end

  def separator(color)
    ("-" * 80).colorize(color)
  end
end
