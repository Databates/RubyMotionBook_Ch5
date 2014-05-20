class AlphabetController < UIViewController 
	def viewDidLoad
		super
		self.title = "Alphabet"
		@table = UITableView.alloc.initWithFrame(self.view.bounds) 
		@table.autoresizingMask = UIViewAutoresizingFlexibleHeight 
		self.view.addSubview(@table)

		#Set our AlphabetController as the table's dataSource
		@table.dataSource = self
		#Make our controller the delegate: 
		@table.delegate = self
		#A table’s dataSource must implement the following methods, or else the app will throw an exception:
		#  tableView:cellForRowAtIndexPath:
		#  tableView:numberOfRowsInSection:

		@data = ("A".."Z").to_a

	end 

	def tableView(tableView, numberOfRowsInSection: section) 
		# return the number of rows
		@data.count
	end

	def tableView(tableView, cellForRowAtIndexPath: indexPath)
  		# return the UITableViewCell for the row
  		@reuseIdentifier ||= "CELL_IDENTIFIER"
  			
  			cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier)
  			cell ||= UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)

  			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator

  			cell.textLabel.text = @data[indexPath.row]
			cell
	end


	def tableView(tableView, didSelectRowAtIndexPath:indexPath) 
		tableView.deselectRowAtIndexPath(indexPath, animated: true) 
		letter = @data[indexPath.row]
        controller = UIViewController.alloc.initWithNibName(nil, bundle:nil)
        controller.view.backgroundColor = UIColor.whiteColor
        controller.title = letter

￼
		label = UILabel.alloc.initWithFrame(CGRectZero)
	    label.text = letter
	    label.sizeToFit
    	label.center = [controller.view.frame.size.width / 2, controller.view.frame.size.height / 2]
    	controller.view.addSubview(label)
 		self.navigationController.pushViewController(controller, animated:true)
	end


end














