class ActiveSupport::TimeWithZone
  def as_json
    localtime.strftime("%Y-%m-%d %H:%M")
  end
end
