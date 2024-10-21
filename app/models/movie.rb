class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, :overview, uniqueness: true

  validates :title, :overview, presence: true

  before_destroy :check_for_bookmarks

  private

  def check_for_bookmarks
    return false if bookmarks.any?
  end
end
