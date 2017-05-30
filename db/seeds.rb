require 'nokogiri'
require 'open-uri'
require 'pry-byebug'

@pagearticle = "0001"

def change_page
  @pagearticle = (@pagearticle.to_i + 100).to_s.rjust(4, "0")
end

def load_page
  url = "http://bo.io.gov.mo/bo/i/99/31/codcivpt/codciv#{@pagearticle}.asp"
  doc = Nokogiri::HTML(open(url, "User-Agent" => "Ruby/#{RUBY_VERSION}"), nil, 'utf-8')
  @element = doc.at('h3').next_element.next_element
end

def nullify_all
  @title = nil
  @subtitle = nil
  @chapter = nil
  @section = nil
  @subsection = nil
  @division = nil
  @subdivision = nil
  @article = nil
end

def create_book(number, heading)
  @book = Book.create(number: number)
  Heading.create(pt: heading, book_id: @book.id)
  puts "Created Book #{@book.number}"
  nullify_all
end

def create_title(number, heading)
  @title = Title.new(number: number)
  @title.book = @book
  @title.save
  Heading.create(pt: heading, title_id: @title.id)
  puts "Created Title #{@title.number}"
  @subtitle = nil
  @chapter = nil
  @section = nil
  @subsection = nil
  @division = nil
  @subdivision = nil
end

def create_subtitle(number, heading)
  @subtitle = Subtitle.new(number: number)
  @subtitle.title = @title
  @subtitle.save
  Heading.create(pt: heading, subtitle_id: @subtitle.id)
  puts "Created Subtitle #{@subtitle.number}"
  @chapter = nil
  @section = nil
  @subsection = nil
  @division = nil
  @subdivision = nil
end

def create_chapter(number, heading)
  @chapter = Chapter.new(number: number)
  @chapter.title = @title
  @chapter.save
  Heading.create(pt: heading, chapter_id: @chapter.id)
  puts "Created Chapter #{@chapter.number}"
  @section = nil
  @subsection = nil
  @division = nil
  @subdivision = nil
end

def create_section(number, heading)
  @section = Section.new(number: number)
  @section.chapter = @chapter
  @section.save
  Heading.create(pt: heading, section_id: @section.id)
  @subsection = nil
  puts "Created Section #{@section.number}"
  @subsection = nil
  @division = nil
  @subdivision = nil
end

def create_subsection(number, heading)
  @subsection = Subsection.new(number: number)
  @subsection.section = @section
  @subsection.save
  Heading.create(pt: heading, subsection_id: @subsection.id)
  puts "Created Subsection #{@subsection.number}"
  @division = nil
  @subdivision = nil
end

def create_division(number, heading)
  @division = Division.new(number: number)
  @division.subsection = @subsection
  @division.save
  Heading.create(pt: heading, division_id: @division.id)
  puts "Created Division #{@division.number}"
  @subdivision = nil
end

def create_subdivision(number, heading)
  @subdivision = Subdivision.new(number: number)
  @subdivision.division = @division
  @subdivision.save
  Heading.create(pt: heading, subdivision_id: @subdivision.id)
  puts "Created Subdivision #{@subdivision.number}"
end

def create_article(number, heading, text)
  @article = Article.new(number: number, pt: text)
  @article.book = @book if @book
  @article.title = @title if @title
  @article.subtitle = @subtitle if @subtitle
  @article.chapter = @chapter if @chapter
  @article.section = @section if @section
  @article.subsection = @subsection if @subsection
  @article.division = @division if @division
  @article.subdivision = @subdivision if @subdivision
  @article.save
  Heading.create(pt: heading, article_id: @article.id)
  puts "Created Article #{@article.number}"
end

def get_category(element)
  element.text.split(" ")[0]
end

def get_number(element)
  element.text.split(" ")[1]
end

def get_article_number(element)
  element.text.split(" ")[1].chop.chop.to_i
end

def get_heading(element)
  element.next_element.text
  move_element
end

def get_article_heading(element)
  element.next_element.text.strip[1..-1].chop
  move_element
end

def get_article_text(element)
  result = []
  while element.name == 'p' do
    result << element.text.gsub(/\r?\n/, '<br>')
    element = element.next_element
  end
  @element = element
  return result
end

def move_element
  @element = @element.next_element
end

def create_element(category)
  case category
  when 'livro'
    create_book(get_number(@element), get_heading(@element))
    move_element
  when 'tÍtulo'
    create_title(get_number(@element), get_heading(@element))
    move_element
  when 'subtÍtulo'
    create_subtitle(get_number(@element), get_heading(@element))
    move_element
  when 'capÍtulo'
    create_chapter(get_number(@element), get_heading(@element))
    move_element
  when 'secÇÃo'
    create_section(get_number(@element), get_heading(@element))
    move_element
  when 'subsecÇÃo'
    create_subsection(get_number(@element), get_heading(@element))
    move_element
  when 'divisÃo'
    create_division(get_number(@element), get_heading(@element))
    move_element
  when 'subdivisÃo'
    create_subdivision(get_number(@element), get_heading(@element))
    move_element
  when 'artigo'
    number = get_article_number(@element)
    heading = get_article_heading(@element)
    move_element
    text = get_article_text(@element)
    create_article(number, heading, text)
  else
    move_element
  end
end

def scrape_page
  until @element.name == 'hr'
    category = get_category(@element).downcase
    create_element(category)
  end
end

until @pagearticle == "2101"
  load_page
  scrape_page
  change_page
end



