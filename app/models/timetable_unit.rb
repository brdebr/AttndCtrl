class TimetableUnit < ApplicationRecord
  belongs_to :timetable
  has_many :attendances, dependent: :delete_all

  def as_json(options = {})
    {
        :id => self.id,
        :title => "· "+self.name.capitalize.truncate(15)+"\n"+self.description.truncate(30),
        :start => self.start_time.strftime("%H:%M"),
        :end => self.finish_time.strftime("%H:%M"),
        :dow => [self.week_day],
        :url => Rails.application.routes.url_helpers.timetable_path(self.timetable),
        :color => "#"+SecureRandom.hex(3).to_s
    }
  end
end
