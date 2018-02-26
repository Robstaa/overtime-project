class StaticController < ApplicationController
  def homepage
    if current_user.is_admin?
      @pending_approvals = Post.submitted
      @recent_audit_items = AuditLog.last(10)
    else
      @pending_audit_confirmations = current_user.audit_logs.where(status: 0).order("start_date DESC")
    end
  end
end
