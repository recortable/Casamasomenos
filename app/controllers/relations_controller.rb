# encoding: utf-8

class RelationsController < ApplicationController
  respond_to :html
  expose(:relations) { Relation.all }
  expose(:relation)

  def show
  end

  def destroy
    authorize! :destroy, relation
    flash[:notice] = 'Relación entre artículos eliminada' if relation.destroy
    respond_with relation, :location => relation.from
  end

end
