json.extract! timetable, :id, :name, :created_at, :updated_at
json.url timetable_url(timetable, format: :json)
