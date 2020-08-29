# == Schema Information
#
# Table name: dogs
#
#  id   :bigint           not null, primary key
#  name :string           not null
#
class Dog < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validate :check_name_length
    def check_name_length
        unless self.name.length >= 4
            errors[:name] << "needs 4+ chars"
        end
    end

    # ruby way
    # def toys
    #     Toy.where({ dog_id: self.id })
    # end

    # or in Rails association:
    has_many(:toys, {
        primary_key: :id,   # dog id
        foreign_key: :dog_id,
        class_name: :Toy
    })

    belongs_to(:house, {
        primary_key: :id,   # house id
        foreign_key: :house_id,
        class_name: :House
    })

    def self.lookup_name_in_ms(name)
        start = Time.now
        Dog.where(name: name)
        (Time.now - start) * 1000
    end
end
