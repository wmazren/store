class BoxRequestAdminPdf < Prawn::Document

  def initialize(box_request, view)
    super(top_margin: 50)
    @box_request = box_request
    @view = view
    logo
    user_info
    # list_package
    list_request
    box_do
    kaki
    repeater
  end

  def logo
    logopath =  "#{Rails.root}/app/assets/images/logo.png"
    image logopath, :width => 125, :height => 23

    draw_text "Box Request - Delivery Order", :at => [150, 600], size: 16, style: :bold
  end

  def user_info
    move_down 10
    text "#{@box_request.user.full_name}", size: 12, style: :bold, align: :right
    text "#{@box_request.user.position}", size: 10, style: :bold, align: :right
    text "#{@box_request.user.business_unit}", size: 10, style: :bold, align: :right
    text "#{@box_request.user.address1}", size: 10, align: :right
    text "#{@box_request.user.address2}", size: 10, align: :right
    text "#{@box_request.user.town}", size: 10, align: :right
    text "#{@box_request.user.postcode}", size: 10, align: :right
    text "#{@box_request.user.state}", size: 10, align: :right
    move_down 10
    text "Phone1 \##{@box_request.user.phone1}", size: 8, align: :right
    text "Phone2 \##{@box_request.user.phone2}", size: 8, align: :right
    text "Phone3 \##{@box_request.user.phone3}", size: 8, align: :right
    text "Fax \##{@box_request.user.fax}", size: 8, align: :right
    text "Mobile \##{@box_request.user.mobile}", size: 8, align: :right
    text "Email \##{@box_request.user.email}", size: 8, align: :right
  end

  def list_package
    text "Request Date \: #{@box_request.created_at.strftime("%d/%m/%Y")}", size: 10
    move_down 20
    rows = [["Box Name", "Floor", "Bay", "Level", "Slot", "Barcode ID"]]
    rows << [@box_request.package.name, @box_request.package.slot.level.bay.floor.name, @box_request.package.slot.level.bay.name, @box_request.package.slot.level.name, @box_request.package.slot.name, @box_request.package.barcode]
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

  def list_request
    text "Request Date \: #{@box_request.created_at.strftime("%d/%m/%Y")}", size: 10
    move_down 20

    rows = [["Date", "Quantity"]]
    rows << [@box_request.created_at.strftime("%d/%m/%Y"), @box_request.quantity]

    table rows, :width => 550 do
      row(0).font_style = :bold
      columns(1..5).align = :center
      columns(0..5).size = 10
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end

  def box_do
    width = 180
    height = 120

    x = 5
    y = 180

    stroke_rectangle [x, y], width, height
    text_box "Received by:", :at => [x +10, y - 10], :width => width - 20, size: 10, align: :center
    text_box "Name:", :at => [x +10, y - 90], :width => width - 20, size: 10, align: :left
    text_box "Date  :", :at => [x +10, y - 100], :width => width - 20, size: 10, align: :left
    text_box "#{@box_request.user.business_unit}", :at => [x + 10, y - 130], :width => width - 20, size: 10, align: :center, style: :bold

    stroke_rectangle [x + 180, y], width, height
    text_box "Confirmed by:", :at => [x + 180, y - 10], :width => width - 20, size: 10, align: :center
    text_box "Name:", :at => [x +190, y - 90], :width => width - 20, size: 10, align: :left
    text_box "Date  :", :at => [x +190, y - 100], :width => width - 20, size: 10, align: :left
    text_box "Rakyat Niaga Sdn. Bhd.", :at => [x + 180 +10, y - 130], :width => width - 20, size: 10, align: :center, style: :bold

    stroke_rectangle [x + 360, y], width, height
    text_box "Transportation:", :at => [x + 360, y - 10], :width => width - 20, size: 10, align: :center
    text_box "Name        :", :at => [x + 370, y - 90], :width => width - 20, size: 10, align: :left
    text_box "Date          :", :at => [x + 370, y - 100], :width => width - 20, size: 10, align: :left
    text_box "Vehicle#    :", :at => [x + 370, y - 110], :width => width - 20, size: 10, align: :left
    text_box "Company:", :at => [x + 360 + 10, y - 130], :width => width - 20, size: 10, align: :left
  end

  def kaki
    number_pages "<page>", { :start_count_at => 0, :page_filter => :all, :at => [bounds.right - 50, 0], :align => :right, :size => 8 }
  end

  def repeater
    repeat(:all) do
      draw_text "Rakyat Niaga Sdn. Bhd. | Store 1.0", :at => bounds.bottom_left, size: 8
    end
  end
end
