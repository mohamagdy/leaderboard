class User < ActiveRecord::Base
  attr_accessible :name

  def self.list(params={})
  	params[:sort] ||= 'overall,level'
  	sort_atts = params[:sort].split(',').select { |att| self.attribute_names.include?(att) }.map { |att| "#{att} DESC" }
	self.paginate(page: params[:page], per_page: params[:top] || 10).order(sort_atts)
  end
end
