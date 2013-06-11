class StorageRequestPdf < Prawn::Document

  def initialize(storage_request, view)
    super(top_margin: 50)
    @storage_request = storage_request
    @view = view
    logo
    user_info
    list_packages
    #list_items
    item_rows
    barcode
    repeater
  end

  def logo
    move_down 10
    logopath =  "#{Rails.root}/app/assets/images/logo.png"
    image logopath, :width => 250, :height => 46

    draw_text "Storage Request Summary", :at => [120, 575], size: 22
  end

  def user_info
    move_down 10
    text "#{@storage_request.user.full_name}", size: 12, style: :bold, align: :right
    text "#{@storage_request.user.position}", size: 10, style: :bold, align: :right
    text "#{@storage_request.user.business_unit}", size: 10, style: :bold, align: :right
    text "#{@storage_request.user.address1}", size: 10, align: :right
    text "#{@storage_request.user.address2}", size: 10, align: :right
    text "#{@storage_request.user.town}", size: 10, align: :right
    text "#{@storage_request.user.postcode}", size: 10, align: :right
    text "#{@storage_request.user.state}", size: 10, align: :right
    move_down 10
    text "Phone1 \##{@storage_request.user.phone1}", size: 8, align: :right
    text "Phone2 \##{@storage_request.user.phone2}", size: 8, align: :right
    text "Phone3 \##{@storage_request.user.phone3}", size: 8, align: :right
    text "Fax \##{@storage_request.user.fax}", size: 8, align: :right
    text "Mobile \##{@storage_request.user.mobile}", size: 8, align: :right
    text "Email \##{@storage_request.user.email}", size: 8, align: :right
  end

  def list_packages
    move_down 20
    #text "Summary", size: 24, style: :bold, align: :center
    move_down 20

    text "Storage Request \# : #{@storage_request.id}", size: 12
    text "Request Date \: #{@storage_request.created_at.strftime("%d/%m/%Y")}", size: 12
    text "Total Number of Box(s) \: #{@storage_request.packages.count}", size: 12

    move_down 20

    table box_rows, :width => 500 do
      row(0).font_style = :bold
      #columns(1..3).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end

  def box_rows
    [["Box ID", "Box Name", "State"]] +
    @storage_request.packages.map do |package|
      [package.id, package.reference_id, package.state]
    end
  end

  def list_items
    move_down 20

    table item_rows do
      row(0).font_style = :bold
      #columns(1..3).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
      #self.column_widths = [30, 200, 200]
    end
  end

  def item_rows
    move_down 20
     #[["Package Name", "User ID", "State"]] +
    @storage_request.packages.map do |package|
      start_new_page
      move_down 20
      text "Box Name \: #{package.reference_id}", size: 16, align: :center
      move_down 20
      text "Box ID \# : #{package.id}", size: 12
      text "Total Number of Item(s) \# : #{package.items.count}", size: 12
      move_down 20

      rows = [["ID", "Item Name"]]
      package.items.map do |item|
        rows << [item.id, item.name]

        #text "#{item.name}", size: 11
        #table([ ["ID", "Package Name", "User ID"],
        #[item.id, item.name, item.user.email]
      end
      table(rows, :column_widths => [30, 400], :header => true, :row_colors => ["F0F0F0", "FFFFCC"])
    end
  end

  def barcode

    start_new_page
    move_down 20

    font "#{Rails.root}/app/assets/fonts/3OF9.TTF" do
      text "HARGOPAL"
    end

  end

  def repeater
    repeat(:all) do
      draw_text "Rakyat Niaga Sdn. Bhd. | Store 1.0", :at => bounds.bottom_left
    end
  end
end
