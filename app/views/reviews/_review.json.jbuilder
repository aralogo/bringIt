json.extract! review, :id, :reviewOn_id, :reviewBy_id, :comment, :created_at, :updated_at
json.url review_url(review, format: :json)
