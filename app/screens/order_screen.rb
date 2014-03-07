class OrderScreen < PM::Screen
  title "Get this Collectible"

  stylesheet :order_screen

  layout :action do
    @scroll = subview UIScrollView, :scroll do
      subview UIImageView, :header
      subview UILabel, :title
      @byline      = subview UILabel, :byline
      @features    = subview UIWebView, :features
      @orderTable  = subview UITableView, :order_table,
                      delegate: self,
                      dataSource: self
    end
  end

  def on_init
    set_nav_bar_button :left,
      title: "Cancel",
      action: :close
  end

  def will_appear
    @features.loadRequest NSURLRequest.requestWithURL("features.html".resource_url)

    @order ||= Order.new.tap do |order|
      order.artistName = "Dream Theater"
    end

    self.loadOrder(@order)

    # weird relayout bug, scrollView won't resize
    1.seconds.later do
      resizeScrollView
    end
  end

  def on_return(args = {})
    @order = args[:order]
    self.loadOrder(@order)
  end

  def loadOrder(order)
    @data = [order.inscriptionRow, order.messageRow]
    @orderTable.reloadData

    @byline.text = "by #{order.artistName}"
  end

  def resizeScrollView
    @scroll.contentSize = [ @scroll.frame.size.width, content_height(@scroll) + 20 ]
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
