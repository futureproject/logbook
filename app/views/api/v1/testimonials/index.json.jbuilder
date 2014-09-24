json.array!(@testimonials) do |testimonial|
  json.extract! testimonial, :id,
    :content,
    :person_id,
    :created_at
end
