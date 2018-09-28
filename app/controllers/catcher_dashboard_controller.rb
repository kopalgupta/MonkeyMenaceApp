class CatcherDashboardController < ApplicationController

	def index
		@pending_contracts = current_catcher.contracts.where(status: 0)
		@completed_contracts = current_catcher.contracts.where(status: 1)
	end

	def view_contract
		contract_id = params[:contract_id]
		@contract = Contract.where(:id => contract_id).first
		official_id = @contract.official_id
		@official = Official.where(:id => official_id).first
		complaint_id = @contract.complaint_id
		@complaint = Complaint.where(:id => complaint_id).first
	end
	
end
