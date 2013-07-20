class StorageRequestShowAllPdf < Prawn::Document

  def initialize(storage_requests, view)
    super(top_margin: 50)
    @storage_requests = storage_requests
    @view = view
    logo
    #list_warehouses
    kaki
    repeater
  end

  def logo
    logopath =  "#{Rails.root}/app/assets/images/logo.png"
    image logopath, :width => 125, :height => 23
    move_down 20
    text "Storage Request Report", size: 16, style: :bold
    move_down 10
  end


  def kaki
    number_pages "<page>", { :start_count_at => 0, :page_filter => :all, :at => [bounds.right - 50, 0], :align => :right, :size => 8 }
  end

  def repeater
    repeat(:all) do
      draw_text "Rakyat Niaga Sdn. Bhd. | Store 1.0", :at => bounds.bottom_left, size: 8
    end
  end

  def helpers
    ActionController::Base.helpers
  end

end
