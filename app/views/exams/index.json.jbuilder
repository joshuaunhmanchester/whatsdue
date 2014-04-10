json.array!(@exams) do |exam|
  json.extract! exam, :id, :exam_id, :exam_name, :details, :comments, :date_created, :date_of_exam, :is_complete, :grade_received, :course_id
  json.url exam_url(exam, format: :json)
end
