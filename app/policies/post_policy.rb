class PostPolicy < ApplicationPolicy
  def update?
    (record.user_id == user.id || user.is_admin?) && record.status == 'submitted'
  end

  def approve?
    user.is_admin? && record.status == "submitted"
  end
end
