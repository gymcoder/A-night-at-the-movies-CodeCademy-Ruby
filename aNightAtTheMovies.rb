# CodeCademy A night at the movies exercise
# I have added a case satetment to check if the user really wants to delete the entry from the collection (line 49 - 60)
# I have added code which swaps the users's input from white spaces to underscores when adding a new movie title (line 16)
# I have added code to stop the user putting a rating higher than 10 for an entry or a string rather than a number (line 20 & 21)


movies = {
    sexy_beast: 10,
    bambi: 5
}
puts "What action would you like to perform? Type one of the following: \"Add\", \"Update\", \"Display\", \"Delete\"?"
choice = gets.chomp.downcase

case choice
  when "add"
    puts "Whats the title?"
    title = gets.chomp.downcase.tr(" ", "_")
    puts "What do you rate this movie between 1 and 10?"
    input = gets.chomp
    rating = Integer input rescue 11
      if !rating || rating > 10
        puts "Rating must be a number between 1 and 10!"
      else 
        if movies[title.to_sym ] == nil
            movies [title.to_sym] = rating.to_i
            puts "The new movie #{title} and it's rating of #{rating} have been added to your collection."
            puts movies                   #sanity check
        else
            puts "Movie already exists! You have already given it a raing of #{movies[title.to_sym]}."
        end
      end
  when "update"
    puts "Please type the title of the movie you would like to update."
    title = gets.chomp.to_sym
        if movies[title.to_sym] == nil
            puts "Movie not in the collection. You need to add it."
        else
            puts "What is the new rating for the movie?"
            rating = gets.chomp.to_i
            movies [title.to_sym] = rating.to_i
            puts "#{title} has been updated to a rating of #{rating}"
        print movies                      #sanity check
        end
  when "display"
    movies.each do |title, rating|
        puts "#{title}: #{rating}"
    end
  when "delete"
    puts "Please type the title of the movie you would like to remove from your collection."
    title = gets.chomp.downcase
    if
        movies[title.to_sym] == nil
        puts "No film with such title to delete."
    else
        puts "Are you sure you want to delete #{title} and it's rating from your collection? Type Y or N..."
          delete_choice = gets.chomp.upcase
            case delete_choice
            when "Y"
              movies.delete(title.to_sym)
              puts "#{title} and it's rating of #{rating} has been deleted from your collection!!"
              puts movies                 #sanity check
            when "N"
              puts "Movie not deleted this time."
            else
              puts "Error!"
            end
    end
  else
    puts "Error!"
end