json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :photo_id, :message
  json.url comment_url(comment, format: :json)
end
