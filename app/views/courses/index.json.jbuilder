json.array!(@courses) do |course|
  json.extract! course, :id, :course_id, :class_name, :details, :teacher_name, :user_id
  json.url course_url(course, format: :json)
end
