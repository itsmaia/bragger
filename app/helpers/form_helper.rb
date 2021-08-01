module FormHelper
  def chronify_output(time_in_seconds = nil, format = :chrono)
    if time_in_seconds
      ChronicDuration.output(time_in_seconds.to_i, format: format, limit_to_hours: true)
    else
      "00:00:00"
    end
  end
end
