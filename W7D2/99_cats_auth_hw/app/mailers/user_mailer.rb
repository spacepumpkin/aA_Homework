class UserMailer < ApplicationMailer
    default from: 'from@example.com'

    def welcome_email(user)
        @user = user # instance var avail to views
        @url = 'https://appacademy.io'
        mail(to: 'Everybody <everybody@appacademy.io>', subject: 'Welcome!!')
    end
end
