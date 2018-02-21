class PostPolicy < ApplicationPolicy
  def update?
    record.user_id == user.id && record.status == 'submitted'
  end
end
