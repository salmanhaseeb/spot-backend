json.spot do
  json.id @spot.id
  json.title @spot.title
  json.description @spot.description
  json.price @spot.price

  json.average_review_star @spot.reviews_average
  json.review_count @spot.reviews.count
  json.reviews @spot.reviews do |review|
    json.id review.id
    json.reviewer_name review.reviewer_name
    json.star review.star
    json.comment review.comment
    json.created_at review.created_at
    json.updated_at review.updated_at
  end
   json.images @spot.images do |image|
    if image.file.attached?
      json.id image.id
      json.file url_for(image.file)
      json.primary image.primary
    end
  end
  json.created_at @spot.created_at
  json.updated_at @spot.updated_at
end
