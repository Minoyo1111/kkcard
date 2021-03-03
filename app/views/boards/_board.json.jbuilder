json.extract! board, :title, :created_at, :updated_at
json.url board_url(board, format: :json)