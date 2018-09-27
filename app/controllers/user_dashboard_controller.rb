class UserDashboardController < ApplicationController

	def index
		@archived_complaints = current_user.complaints.where(resolved: true)
		@active_complaints = current_user.complaints.where(resolved: false)
	end

	def update
	end

	# def complaints_display
	# 	@archived_complaints = current_user.complaints.where(resolved: true)
	# 	@active_complaints = current_user.complaints.where(resolved: false)
	# end

	def view_complaint
		complaint_id = params[:complaint_id]
		@complaint = Complaint.where(:id => complaint_id).first
	end

	def new_complaint 
	end

	def create_complaint 
		# render plain: params[:post].inspect
		current_user.complaints.create(description: params[:description], monkeys_spotted: params[:monkeys_spotted], location: params[:location])
		return redirect_to user_dashboard_path
	end

	def edit_complaint
		complaint_id = params[:complaint_id]
		@complaint = Complaint.where(:id => complaint_id).first
		# @complaint = Complaint.find(params[:id])
	end

	def update_complaint
		complaint_id = params[:edit_id]
		complaint = Complaint.where(:id => complaint_id).first
		complaint.description = params[:new_description]
		complaint.monkeys_spotted = params[:new_monkeys_spotted]
		complaint.location = params[:new_location]
		complaint.save
		redirect_to user_dashboard_path
	end

	def delete_complaint 
		complaint_id = params[:complaint_id]
		@complaint = Complaint.where(:id => complaint_id).first
		@complaint.destroy
		redirect_to user_dashboard_path
	end

	def complaint_resolved
		complaint_id = params[:complaint_id]
		@complaint = Complaint.where(:id => complaint_id).first
		@complaint.resolved = true
		@complaint.status = 2
		@complaint.save
		redirect_to user_dashboard_path
	end

	

end
