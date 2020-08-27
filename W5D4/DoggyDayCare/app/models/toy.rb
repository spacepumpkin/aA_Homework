class Toy < ApplicationRecord

    # def dog
    #     Dog.find(dog_id)
    # end

    belongs_to(:dog, {
        primary_key: :id,   # Dog's id
        foreign_key: :dog_id, # Toys table
        class_name: :Dog
    })

    # INNER JOIN with through and source
    has_one(:house, {
        through: :dog,
        source: :house
    })
end