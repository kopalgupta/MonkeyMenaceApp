class OfficialDashboardController < ApplicationController

	def index
		@active_complaints = current_official.complaints.where(resolved: false)
		@archived_complaints = current_official.complaints.where(resolved: true)
		@pending_contracts = current_official.contracts.where(status: 0)
		@completed_contracts = current_official.contracts.where(status: 1)
	end

	def view_all
		@complaints = Complaint.where(status: 0)
	end

	def add_complaint
		complaint_id = params[:complaint_id]
		complaint = Complaint.find_by_id(complaint_id)
		complaint.official_id = current_official.id
		complaint.status = 1
		complaint.save
		redirect_to official_dashboard_path
	end

	def mark_complaint_as_completed
		complaint_id = params[:complaint_id]
		@complaint = Complaint.where(:id => complaint_id).first
		@complaint.status = 2
		@complaint.save
		redirect_to official_dashboard_path
	end

	def view_complaint
		complaint_id = params[:complaint_id]
		@complaint = Complaint.where(:id => complaint_id).first
		user_id = @complaint.user_id
		@user = User.where(:id => user_id).first
		@contracts = Contract.where(:complaint_id => complaint_id)
	end

	def view_all_catchers
		@catchers = Catcher.all
		@complaint_id = params[:complaint_id]
	end

	def create_contract_get
		@complaint_id = params[:complaint_id]
		@catcher_id = params[:catcher_id]
		complaint_id = params[:complaint_id]
		complaint = Complaint.find_by_id(complaint_id)
		@location = complaint.location
	end

	def create_contract
		current_official.contracts.create(description: params[:description], amount: params[:amount], complaint_id: params[:complaint_id], catcher_id: params[:catcher_id])
		return redirect_to official_dashboard_path
	end

	def view_contract
		contract_id = params[:contract_id]
		@contract = Contract.where(:id => contract_id).first
		catcher_id = @contract.catcher_id
		@catcher = Catcher.where(:id => catcher_id).first
	end

	def mark_contract_as_completed
		contract_id = params[:contract_id]
		@contract = Contract.where(:id => contract_id).first
		@contract.status = 1
		@contract.save
		redirect_to official_dashboard_path
	end


	
end
