module ApplicationHelper
  def simple_time(time)
    time.strftime("%Y年%m月%d日%H時%M分")
  end
  def date_time(time)
    time.strftime("%Y年%m月%d日")
  end
end
