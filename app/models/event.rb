class Event < ApplicationRecord
  enum event_type: { click: 0, click_and_drag: 1, clipboard: 2, visibility: 3, start: 4 }
  belongs_to :student_assignment

  # Determine event type from string
  def self.type_from(event_type)
    case event_type
    when "click"
      0
    when "click-and-drag"
      1
    when "clipboard"
      2
    when "visibility"
      3
    when "start"
      4
    else
      raise ActiveRecord::RecordInvalid.new(e)
    end
  end
end
