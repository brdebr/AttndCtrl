class TimetableUnit < ApplicationRecord
  belongs_to :timetable

  def as_json(options = {})
    {
        :id => self.id,
        :title => self.name+"\n"+self.description.truncate(20),
        :start => self.start_time.strftime("%H:%M"),
        :end => self.finish_time.strftime("%H:%M"),
        :dow => [self.week_day],
        :url => Rails.application.routes.url_helpers.timetable_path(self.timetable),
        :color => "#"+SecureRandom.hex(3).to_s
    }
  end
end
