module TimeSheetsHelper
  def calender_view(time_sheet)
    holiday = Holiday.new
    week_array = holiday.days_dates_array(time_sheet.start_date)
    return week_array
  end
end
