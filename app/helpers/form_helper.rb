module FormHelper
  def chronify_output(time_in_seconds = nil)
    if time_in_seconds
      ChronicDuration.output(time_in_seconds.to_i, format: :chrono)
    else
      "00:00:00"
    end
  end
end
