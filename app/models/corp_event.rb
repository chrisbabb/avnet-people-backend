class CorpEvent < ApplicationRecord
    has_many :event_links
    has_many :people, through: :event_links
end
