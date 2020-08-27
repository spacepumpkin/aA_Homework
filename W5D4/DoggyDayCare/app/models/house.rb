

class House < ApplicationRecord

    has_many( :dogs, {
        primary_key: :id,
        foreign_key: :house_id,
        class_name: :Dog
    })

    # long way
    def toys
        toys = []

        dogs.each do |dog|
            toys.concat(dog.toys)
        end
        toys
    end

    # using through and source keys to reference :dogs and :toys methods
    has_many(:toys, {
        through: :dogs,     # house association
        source: :toys       # dog association
    })
end