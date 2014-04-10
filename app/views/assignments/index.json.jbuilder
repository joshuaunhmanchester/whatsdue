json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :assignment_id, :assignment_name, :details, :priority, :date_created, :date_due, :is_complete, :grade_received, :cours_id
  json.url assignment_url(assignment, format: :json)
end
