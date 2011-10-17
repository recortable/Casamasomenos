
class Category < ActiveRecord::Base
  has_many :articles

  CATEGORIES = ['page', 'area', 'concept', 'strategy', 'typological', 'management', 'participatory', 'experience']
end