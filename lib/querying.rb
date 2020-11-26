def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT DISTINCT books.title, books.year
  FROM books
  JOIN series
  ON books.series_id = series_id
  WHERE books.series_id = 1
  ORDER BY books.year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, characters.motto
  FROM characters
  ORDER BY length(characters.motto) DESC LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT characters.species, COUNT(species) as count
  FROM characters
  GROUP BY species
  ORDER BY count DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM authors
  JOIN series
  ON authors.id = series.author_id
  JOIN subgenres
  ON series.subgenre_id = subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title
  FROM series
  JOIN authors
  ON series.author_id = authors.id
  JOIN characters
  ON authors.id = characters.author_id
  GROUP BY series.title
  ORDER BY COUNT(characters.name) LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(books.title) as count
  FROM characters
  JOIN character_books
  ON character_books.character_id = characters.id
  JOIN books
  ON character_books.book_id = books.id
  GROUP BY characters.name
  ORDER BY count DESC, characters.name;
  "
end
