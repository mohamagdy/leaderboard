class User < ActiveRecord::Base
  attr_accessible :name

  # This method takes the sorting and pagination parameters and select
  # the top users specified by the "top" parameter and sort the users
  # with the given "sort" parameters which is a comma separated string. For example level,overall.
  # params
  #   sort: sort parameters string comma separated. Default is overall,level
  #   top: number that specifies top X users. Default is 10
  #   page: page number. Default is 1
  def self.list(params={})
  	params[:sort] ||= 'overall,level'
  	sort_atts = params[:sort].split(',').select { |att| self.attribute_names.include?(att) }.map { |att| "#{att} DESC" }
	self.paginate(page: params[:page], per_page: params[:top] || 10).order(sort_atts)
  end
end
