class OwattersController < ApplicationController
  before_action :set_owatter, only: [:edit, :show, :update, :destroy]
  before_action :user_exist, only: [:new, :edit, :show]

  def top
    render :layout => nil
  end

  def index
    @owatter = Owatter.all
  end

  def new
    if params[:back]
      @owatter = Owatter.new(owatter_params)
    else
      @owatter = Owatter.new
    end
  end

  def create
    @owatter = Owatter.new(owatter_params)
    if @owatter.save
      redirect_to owatters_path, notice:"ブログを新規作成しました!"
    else
      render 'new'
      #参考ページ https://rails-study.net/validation/
    end
  end

  def show
  end

  def edit
  end

  def update
    if @owatter.update(owatter_params)
      redirect_to owatters_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @owatter.destroy
    redirect_to owatters_path, notice: "ブログを削除しました！"
  end

  def confirm
    @owatter = Owatter.new(owatter_params)
    render :new if @owatter.invalid?
  end

  def grave
    @owatter = Owatter.all
  end

  private

  def owatter_params
    params.require(:owatter).permit(:content)
  end

  def set_owatter
    @owatter = Owatter.find(params[:id])
  end

  def user_exist
    if logged_in?

    else
      redirect_to new_user_path
    end
  end
end
  
