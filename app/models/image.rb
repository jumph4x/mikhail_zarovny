class Image < ActiveRecord::Base
  mount_uploader :upload, ArtPieceUploader

  default_scope { order('id DESC') }

  validates :title, presence: true
  validates :year, presence: true
  validates :discipline, presence: true
  validates :subject_matter, presence: true
  validates :upload, presence: true
  validates :price, numericality: true, allow_blank: true
end
