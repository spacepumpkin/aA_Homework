class Corgi < ApplicationRecord
    # has_many :toys, as: :toyable
    include Toyable
end
