require 'wikipedia'
class WikipediaLoader
  attr_reader :wiki_title

  def initialize(args = {})
    page = Wikipedia.find(args.fetch(:element_name))
    @wiki_title = page.title.gsub(' ', '_')
  end

end
