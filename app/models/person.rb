class Person < ApplicationRecord
  has_many :event_links
  has_many :corp_events, through: :event_links
  has_one_attached :image

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end

end
