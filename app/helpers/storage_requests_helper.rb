module StorageRequestsHelper

  def storage_requests_chart_data
    StorageRequest.select("MONTH(created_at) as month, COUNT(id) as total").where(:created_at => 6.months.ago.to_date..Date.today).group("month").map do |x|
      {
        created_at: x.month,
        requests: x.total
      }
    end
  end
end
