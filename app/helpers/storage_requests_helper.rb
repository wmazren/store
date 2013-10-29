module StorageRequestsHelper

  def storage_requests_chart_data
    # range = "created_at #{(12.months.ago.to_date..Date.today).to_s(:db)}"
    # @users = User.count(:all, :conditions => range, :group => "DATE_FORMAT(created_at, '%Y-%m')", :order =>"created_at ASC")
    #range = "created_at #{(3.months.ago.to_date..Date.today).to_s(:db)}"
    (3.months.ago.to_date..Date.today).group_by.map do |date|
      #August, Sept, October
      {
        created_at: date.strftime("%B"),
        requests: StorageRequest.all.group_by { |m| m.created_at.beginning_of_month }.count
        # requests: StorageRequest.where("date(created_at) = ?", date).count(:id)
        # requests: StorageRequest.where("date(created_at) = ?", date).count
        #requests: StorageRequest.count(:group=>"date_trunc('month', created_at)", :conditions => date)
        #requests: StorageRequest.count(:all, :conditions => date, :group => "DATE_FORMAT(created_at, '%Y-%m')", :order =>"created_at ASC")
        #requests: StorageRequest.where("strftime('%B', created_at) = ?", date.strftime('%B')).count(:id)
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
