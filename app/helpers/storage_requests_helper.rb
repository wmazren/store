module StorageRequestsHelper

  def storage_requests_chart_data
    (3.months.ago.to_date..Date.today).map do |date|
      {
        created_at: date,
        requests: StorageRequest.where("date(created_at) = ?", date).count(:id)
      }
    end
  end

end
