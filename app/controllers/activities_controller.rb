class ActivitiesController < ApplicationController
	after_action :read_all_notifications 

  def index
  	@activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.id, owner_type: "User")
  	@notification_count = @activities.where(:read => false).count  
  end

  def read_all_notifications
  	@activities = PublicActivity::Activity.update_all(:read => true)                
  end 
end
