class OrderScreen < ScrollViewScreen
  title "Get this Collectible"

  stylesheet :order_screen

  layout :action do
    @picker = FDTakeController.alloc.init
    @picker.delegate = self
    @picker.viewControllerForPresentingImagePickerController = self

    @scrollView = subview UIScrollView, :scroll do
      subview UIImageView, :header
      subview UILabel, :title
      subview UILabel, :photo_title
      @byline      = subview UILabel, :byline
      @features    = subview UIWebView, :features
      @orderTable  = subview UITableView, :order_table,
                      delegate: self,
                      dataSource: self

      @imagesView = subview UIView, :image_picker do
        @imagePicker   = subview UIButton, :image_picker_button
      end
    end
  end

  def on_init
    set_nav_bar_button :left,
      title: "Cancel",
      action: :close

    @submitButton = set_nav_bar_button :right,
      title: "Submit",
      action: :submit,
      style: :done
  end

  def will_appear
    super

    @imagePicker.on_tap { @picker.takePhotoOrChooseFromLibrary }

    @features.loadRequest NSURLRequest.requestWithURL("features.html".resource_url)

    @order ||= Order.new(artistName: "Linkin Park")

    self.loadOrder(@order)
  end

  def submit
    if @order.valid?
      @alert = App.alert("Placing Order, please wait...")
      @order.submit(->{
        @alert.dismiss
        close
      }.weak!, onFailure: ->{
        @alert.dismiss
        App.alert("Order Failed!")
      }.weak!) do
      end
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

    @order.withImage do |full_resolution|
      image = full_resolution || "order/ic_upload".uiimage

      @imagePicker.setImage(image, forState: UIControlStateNormal)
      @imagePicker.setImage(image, forState: UIControlStateSelected)
    end


    @submitButton.enabled = @order.valid?
  end

  # FDTakeDelegate

  def takeController(controller, didCancelAfterAttempting:madeAttempt)
    resizeScrollView
  end

  def takeController(controller, didFailAfterAttempting:madeAttempt)
    resizeScrollView
  end

  def takeController(controller, gotPhoto:photo, withInfo:info)
    puts info

    @order.imageURL= info["UIImagePickerControllerReferenceURL"]

    self.loadOrder(@order)
  end

  # UITableViewDelegate

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
