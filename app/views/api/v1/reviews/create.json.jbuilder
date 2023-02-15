json.review do
  json.id @review.id
  json.reviewer_name @review.reviewer_name
  json.star @review.star
  json.comment @review.comment
  json.spot @review.spot
  json.created_at @review.created_at
  json.updated_at @review.updated_at
end
