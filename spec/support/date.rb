def weekend_date
  today = Date.today

  if today.wday == 6 || today.wday == 0
    today
  else
    today + ((6 - today.wday) + 1)
  end
end
