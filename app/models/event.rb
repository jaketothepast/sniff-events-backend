class Event < ApplicationRecord
  enum event_type: { click: 0, click_and_drag: 1, clipboard: 2, tab_switch: 3, start: 4, copy: 5, paste: 6 }
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
    when "tab-switch"
      3
    when "start"
      4
    when "copy"
      5
    when "paste"
      6
    else
      raise RuntimeError.new("FUCK")
    end
  end
end
