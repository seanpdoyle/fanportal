class OrderScreen < ScrollViewScreen
  title "Get this Collectible"

  stylesheet :order_screen

  layout :action do
    @scrollView = subview UIScrollView, :scroll do
      subview UIImageView, :header
      subview UILabel, :title
      subview UILabel, :photo_title

      @byline      = subview UILabel, :byline
      @features    = subview UIWebView, :features
      @orderTable  = subview UITableView, :order_table,
                      delegate: self,
                      dataSource: self
      @picker      = subview UIButton, :picker

    end
  end

  def on_init
    set_nav_bar_button :left,
      title: "Cancel",
      action: :close

    set_nav_bar_button :right,
      title: "Submit",
      action: :submit,
      style: :done
  end

  def submit

  end

  def will_appear
    super
    @features.loadRequest NSURLRequest.requestWithURL("features.html".resource_url)

    @order ||= Order.new(artistName: "Dream Theater")

    self.loadOrder(@order)

    @picker.on_tap do
      # open UIImagePickerController.new
    end
  end

  def on_return(args = {})
    [:message, :inscription].each do |key|
      if text = args[key]
        @order[key] = text
      end
    end
    self.loadOrder(@order)
  end

  def loadOrder(order)
    @data = [order.inscriptionRow, order.messageRow]
    @orderTable.reloadData

    @byline.text = "by #{order.artistName}"
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:@reuseIdentifier)
    end
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator

    cell.textLabel.text = @data[indexPath.row].title
    cell.detailTextLabel.text = @data[indexPath.row].subtitle

    cell
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @data.count
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    open @data[indexPath.row].screen.new(order: @order)
  end
end
