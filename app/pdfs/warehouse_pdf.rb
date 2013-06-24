class WarehousePdf < Prawn::Document

  def initialize(warehouse, view)
    super(top_margin: 50)
    @warehouse = warehouse
    @view = view
    logo
    list_warehouse
    kaki
    repeater
  end

  def logo
    logopath =  "#{Rails.root}/app/assets/images/logo.png"
    image logopath, :width => 125, :height => 23
    move_down 20
    text "Warehouse Summary", size: 16, style: :bold
    move_down 10
  end

  def list_warehouse
    rows = [["Store Name", "Floors", "Capacity", "Occupied", "Free"]]
    rows << [@warehouse.name, helpers.pluralize(@warehouse.floors.size, "Floor"), helpers.pluralize(@warehouse.slots.size, "Slot"), helpers.pluralize(@warehouse.slots.where(:state => "assigned").size, "Slot"), helpers.pluralize(@warehouse.slots.where(:state => "available").size, "Slot")]
    #table(rows, :column_widths => [], :header => true, :row_colors => ["F0F0F0", "FFFFCC"])
    table rows, :width => 550 do
      #:column_widths => [], :header => true, :row_colors => ["F0F0F0", "FFFFCC"])
      row(0).font_style = :bold
      #columns(1..3).align = :center
      columns(1..5).align = :center
      columns(0..5).size = 10
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
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
