class PostPolicy < ApplicationPolicy

def destroy?
  can_moderate?
end

end