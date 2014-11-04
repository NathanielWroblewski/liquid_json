class Route < ActiveRecord::Base
  has_many :variables

  validates :route_id, uniqueness: true

  before_save :translate_markdown_to_liquid, if: :markdown

  def translate_markdown_to_liquid
    self.liquid = $markdown.render(markdown)
  end
end
