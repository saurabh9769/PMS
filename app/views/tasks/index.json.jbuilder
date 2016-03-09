json.array!(@tasks) do |task|
  json.extract! task, :id, :mid, :name, :description, :start_date, :end_date, :status
  json.url task_url(task, format: :json)
end
