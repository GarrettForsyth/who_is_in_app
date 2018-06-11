class Roster < ApplicationRecord
  belongs_to :team
  has_one :captain, through: :team

  def captain?(member)
    member == captain
  end
end
