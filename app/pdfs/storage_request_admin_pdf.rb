class StorageRequestAdminPdf < Prawn::Document

  def initialize(storage_request, view)
    super(top_margin: 50)
    @storage_request = storage_request
    @view = view
    logo
    user_info
    list_packages
    box
    kaki
    repeater
  end

  def logo
    logopath =  "#{Rails.root}/app/assets/images/logo.png"
    image logopath, :width => 125, :height => 23

    draw_text "Storage Request Summary", :at => [150, 600], size: 16
  end

  def user_info
    # move_down 10
    text "#{@storage_request.user.full_name}", size: 10, style: :bold, align: :right
    text "#{@storage_request.user.position}", size: 10, style: :bold, align: :right
    text "#{@storage_request.user.business_unit}", size: 10, style: :bold, align: :right
    text "#{@storage_request.user.address1}", size: 10, align: :right
    text "#{@storage_request.user.address2}", size: 10, align: :right
    text "#{@storage_request.user.town}", size: 10, align: :right
    text "#{@storage_request.user.postcode}", size: 10, align: :right
    text "#{@storage_request.user.state}", size: 10, align: :right
    move_down 5
    text "Phone1 \##{@storage_request.user.phone1}", size: 8, align: :right
    text "Phone2 \##{@storage_request.user.phone2}", size: 8, align: :right
    text "Phone3 \##{@storage_request.user.phone3}", size: 8, align: :right
    text "Fax \##{@storage_request.user.fax}", size: 8, align: :right
    text "Mobile \##{@storage_request.user.mobile}", size: 8, align: :right
    text "Email \##{@storage_request.user.email}", size: 8, align: :right
  end

  def list_packages
    text "Request Date \: #{@storage_request.created_at.strftime("%d/%m/%Y")}", size: 10
    text "Total Number of Box(s) \: #{@storage_request.packages.count}", size: 10

    #move_down 20

    text "Store \: #{@storage_request.warehouse.name}", style: :bold, size: 14, align: :center

    move_down 20

    table box_rows, :width => 550 do
      row(0).font_style = :bold
      #columns(1..3).align = :center
      columns(1..5).align = :center
      columns(0..5).size = 10
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end

  def box_rows
    [["Box Name", "Floor", "Bay", "Level", "Slot", "Barcode ID"]] +
    @storage_request.packages.map do |package|
      @floor = package.slot.level.bay.floor.name
      @bay = package.slot.level.bay.name
      @level = package.slot.level.name
      @slot = package.slot.name
      [package.reference_id, @floor, @bay, @level, @slot, package.barcode]
    end
  end

  def box
    width = 180
    height = 120

    x = 5
    y = 180

    stroke_rectangle [x, y], width, height
    text_box "Confirmed by:", :at => [x +10, y - 10], :width => width - 20, size: 10, align: :center
    text_box "Name:", :at => [x +10, y - 90], :width => width - 20, size: 10, align: :left
    text_box "Date  :", :at => [x +10, y - 100], :width => width - 20, size: 10, align: :left
    text_box "#{@storage_request.user.business_unit}", :at => [x + 10, y - 130], :width => width - 20, size: 10, align: :center, style: :bold

    stroke_rectangle [x + 180, y], width, height
    text_box "Received by:", :at => [x + 180, y - 10], :width => width - 20, size: 10, align: :center
    text_box "Name:", :at => [x +190, y - 90], :width => width - 20, size: 10, align: :left
    text_box "Date  :", :at => [x +190, y - 100], :width => width - 20, size: 10, align: :left
    text_box "Rakyat Niaga Sdn. Bhd.", :at => [x + 180 +10, y - 130], :width => width - 20, size: 10, align: :center, style: :bold

    stroke_rectangle [x + 360, y], width, height
    text_box "Transportation:", :at => [x + 360, y - 10], :width => width - 20, size: 10, align: :center
    text_box "Name:", :at => [x + 370, y - 90], :width => width - 20, size: 10, align: :left
    text_box "Date  :", :at => [x + 370, y - 100], :width => width - 20, size: 10, align: :left
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
