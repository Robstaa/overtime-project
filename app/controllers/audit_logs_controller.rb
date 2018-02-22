class AuditLogsController < ApplicationController

  def index
    @audit_logs = AuditLog.all.order(:start_date).page(params[:page]).per(15)
    authorize @audit_logs
  end
end
