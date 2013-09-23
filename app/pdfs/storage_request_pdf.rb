class StorageRequestPdf < Prawn::Document

  def initialize(storage_request, view)
    super(top_margin: 50)
    @storage_request = storage_request
    @view = view
    logo
    user_info
    list_packages
    item_rows
    #kaki
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

    move_down 20

    table box_rows, :width => 550 do
      row(0).font_style = :bold
      columns(1..5).align = :center
      columns(0..5).size = 10
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end

  def box_rows
    [["Box Name", "Total Items", "Barcode ID"]] +
    @storage_request.packages.map do |package|
      [package.name, package.items.count, package.barcode]
    end
  end

  def item_rows
    move_down 20
    @storage_request.packages.map do |package|
      start_new_page(:layout => :portrait)
      move_down 20
      font "#{Rails.root}/app/assets/fonts/3OF9.TTF" do
        text "#{package.barcode}", size: 24, align: :center
      end
      move_down 5
      text "#{package.barcode}", size: 10, align: :center

      move_down 20
      text "Box Name \: #{package.name}", size: 16, align: :center
      move_down 20
      text "Total Number of Item(s) \# : #{package.items.count}", size: 10
      move_down 20

      rows = [["Item Name"]]
      package.items.map do |item|
        rows << [item.name]
      end
      #table(rows, :column_widths => [30, 400], :header => true, :row_colors => ["F0F0F0", "FFFFCC"])
      table rows, :width => 540 do
        row(0).font_style = :bold
        columns(0).align = :center
        columns(0..5).size = 10
        self.row_colors = ["DDDDDD", "FFFFFF"]
        self.header = true
      end

      start_new_page(:layout => :landscape)
      move_down 100
      font "#{Rails.root}/app/assets/fonts/3OF9.TTF" do
        text "#{package.barcode}", size: 100, align: :center
      end
      move_down 5
      text "#{package.barcode}", size: 30, align: :center

      move_down 50
      text "#{package.name}", size: 24, align: :center
      move_down 20
      text "Total Number of Item(s) \# : #{package.items.count}", size: 24, align: :center
      move_down 20
    end
  end

  def kaki
    number_pages "<page>", { :start_count_at => 0, :page_filter => :all, :at => [bounds.right - 50, 0], :align => :right, :size => 8 }
  end

  def repeater
    repeat(:all) do
      draw_text "Rakyat Niaga Sdn. Bhd. | Store 1.0", :at => bounds.bottom_left, size: 8
      number_pages "<page>", { :start_count_at => 0, :page_filter => :all, :at => bounds.bottom_left, :align => :right, size: 8 }
    end
  end
end
