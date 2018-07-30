class Helpers
    def back_to_the_past(email)
        HTTParty.get("https://marktasks.herokuapp.com/api/reset/#{email}?clean=full")
    end
end