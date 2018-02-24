class AuditLogsController < ApplicationController

  def index
    @audit_logs = AuditLog.all.order(:start_date).page(params[:page]).per(15)
    authorize @audit_logs
  end

  def confirm
    @audit_log = AuditLog.find(params[:id])
    authorize @audit_log
    @audit_log.confirmed!
    redirect_to root_path, notice: "Thank you for confirming"
  end
end
