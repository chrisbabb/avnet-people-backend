class CorpEventSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :date, :people
  has_many :event_links
  has_many :people, through: :event_links
end
