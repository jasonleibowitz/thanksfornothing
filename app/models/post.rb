class Post < ActiveRecord::Base

  belongs_to :user
  belongs_to :team
  has_and_belongs_to_many :tags
  validates :title, :post_text, presence: true

  def parse_and_save_tags(tag_string)
    tag_array = tag_string.split(', ')
    tag_array.each do |tag|
      new_tag = Tag.find_or_create_by(name: tag)
      unless self.tags.include? new_tag
        self.tags.push(new_tag)
      end
    end
  end

end
