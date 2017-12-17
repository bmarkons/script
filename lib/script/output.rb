module Script::Output
  module_function

  def started(step)
    [
      separator,
      "Started: #{step.headline}",
      ""
    ].join("\n").colorize(:yellow)
  end

  def result(step)
    color = :green if step.result == :succeded
    color = :red   if step.result == :failed

    [
      "",
      "#{step.result.capitalize}: #{step.headline}",
      separator
    ].join("\n").colorize(color)
  end

  def separator
    "-" * 80
  end
end
