module FormHelper
  def chronify_output(time_in_seconds = nil, format = :chrono)
    if time_in_seconds
      ChronicDuration.output(time_in_seconds.to_i, format: format)
    else
      "00:00:00"
    end
  end
end
