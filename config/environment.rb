# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# define paginate previous_label and next_label
WillPaginate::ViewHelpers.pagination_options[:previous_label] = '&laquo'
WillPaginate::ViewHelpers.pagination_options[:next_label]     = '&raquo'

