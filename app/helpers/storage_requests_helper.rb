module StorageRequestsHelper

  def storage_requests_chart_data
    (3.months.ago.to_date..Date.today).map do |date|
      #August, Sept, October
      {
        created_at: date,
        #requests: StorageRequest.where("date(created_at) = ?", date).count(:id)
        requests: StorageRequest.where("strftime('%m', created_at) = ?", date.strftime('%m')).count(:id)
      }
    end
  end

end



#  def storage_requests_chart_data
 #   two_months_ago = 2.months.ago
  #  one_month_ago = 1.month.ago.to_date.month
  #  current_month = Date.to_date.months
  #  date_array = [two_months_ago, one_month_ago, current_month]
#
 #   date_array.each do |date|
 #     {
 #       created_at: date,
 #       requests: StorageRequest.where("strftime('%m', created_at) = ?", date.strftime('%B')).count(:id)
 #     }
  #  end
 # end
