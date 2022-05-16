class Chart < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  TYPES = [[I18n.t("charts.model.types.simple"), "simple"]]
end
