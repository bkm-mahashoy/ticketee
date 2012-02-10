class State < ActiveRecord::Base

  def to_s
    name
  end

  def default!
    current_default = State.find_by_default(true)

    if (current_default)
      current_default.default = false
      current_default.save!
    end

    self.default = true
    self.save!
  end
end
