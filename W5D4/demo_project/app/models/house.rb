# == Schema Information
#
# Table name: houses
#
#  id      :bigint           not null, primary key
#  address :string           not null
#
class House < ApplicationRecord
    validates(:address, {presence: true})

    # ruby method
    # def people
    #     Person.where({ house_id: self.id })
    # end

    # rails method
    has_many(:residents, {
        primary_key: :id,
        foreign_key: :house_id,
        class_name: :Person
    })
end
