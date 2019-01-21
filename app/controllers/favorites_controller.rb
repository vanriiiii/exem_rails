class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(owatter_id: params[:owatter_id])
    redirect_to owatters_url, notice: "#{favorite.owatter.user.name}さんのブログをお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to owatters_url, notice: "#{favorite.owatter.user.name}さんのブログをお気に入り解除しました"
  end
end
