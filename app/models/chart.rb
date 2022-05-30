class Chart < ApplicationRecord
  belongs_to :user
  has_many :points, dependent: :destroy

  validates :title, presence: true

  TYPES = [[I18n.t("charts.model.types.simple"), "simple"]]
end
