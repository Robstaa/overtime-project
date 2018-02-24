class AuditLogPolicy < ApplicationPolicy
  def index?
    return true if admin_types.include?(user.type)
  end

  def confirm?
    return true if record.user_id == user.id
  end
end
