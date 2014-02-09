class Image < ActiveRecord::Base
  mount_uploader :upload, ArtPieceUploader

  validates :title, presence: true
  validates :year, presence: true
  validates :discipline, presence: true
  validates :subject_matter, presence: true
  validates :upload, presence: true
end
