class AuditLogPolicy < ApplicationPolicy
  def index?
    return true if admin_types.include?(user.type)
  end
end
