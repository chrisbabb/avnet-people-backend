class PeopleSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :firstname, :lastname, :title, :sex, :company, :notes, :corp_events, :image_url
  has_many :event_links
  has_many :corp_events, through: :event_links
end