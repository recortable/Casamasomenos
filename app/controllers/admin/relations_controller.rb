class Admin::RelationsController < Admin::ResourceController
  resource :relation
  expose(:relations) { Relation.scoped }
end
