class Ticket < ActiveRecord::Base

  searcher do
    label :tag, from: :tags, field: :name
    label :state, from: :state, field: :name
  end

  belongs_to :project
  belongs_to :user
  belongs_to :state

  has_many :assets
  accepts_nested_attributes_for :assets

  has_many :comments

  has_and_belongs_to_many :tags
  has_and_belongs_to_many :watchers, join_table: :ticket_watchers,
                          class_name: "User"

  after_create :creator_watches_this_ticket

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  def tag!(tags)
    tags.split(" ").each do |tag_name|
      self.tags << Tag.find_or_create_by_name(tag_name)
    end
  end

  private

  def creator_watches_this_ticket
    self.watchers << user
  end
end
