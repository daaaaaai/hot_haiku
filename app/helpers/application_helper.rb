module ApplicationHelper
  def datetimeformat(date)
    case date.class.to_s
    when "ActiveSupport::TimeWithZone", "Time", "DateTime"
      date.strftime("%Y/%m/%d(#{%w(日 月 火 水 木 金 土)[date.wday]}) %H:%M")
    when "Date"
      date.strftime("%Y/%m/%d(#{%w(日 月 火 水 木 金 土)[date.wday]})")
    else
      ""
    end
  end
end
