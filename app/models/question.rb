class Question < ApplicationRecord
  belongs_to :test
  has_many :choices

  def type
    choices = choices.where(correct: true).length
    case
    when choices == 0
      :incomplete
    when choices == 1
      :multiple_choice
    else
      :select_all_that_apply
    end
  end

end
