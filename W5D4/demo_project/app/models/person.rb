# == Schema Information
#
# Table name: people
#
#  id       :bigint           not null, primary key
#  name     :string           not null
#  house_id :integer          not null
#
class Person < ApplicationRecord
    validates :name, presence: true
    validates :house_id, presence: true, uniqueness: true

    # ruby method
    # def house
    #     House.find(house_id)
    # end

    # rails method
    belongs_to(:house, {
        primary_key: :id,
        foreign_key: :house_id,
        class_name: :House
    })
end

