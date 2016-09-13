json.extract! jeux_video, :id, :created_at, :updated_at
json.url jeux_video_url(jeux_video, format: :json)