class OwattersController < ApplicationController
  before_action :set_owatter, only: [:edit, :show, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
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
    @owatter = current_user.owatters.build(owatter_params)
    if @owatter.save
      redirect_to owatters_path, notice:"ブログを新規作成しました!"
      OwatterMailer.owatter_mail(@owatter).deliver
    else
      render 'new'
      #参考ページ https://rails-study.net/validation/
    end
  end

  def ensure_correct_user
    @owatter = Owatter.find_by(id:params[:id])
    @current_user = current_user
    if @owatter.user_id != @current_user.id
      flash[:notice] = "#{@owatter.user.name}の投稿した内容の変更権限は#{@current_user.name}にはありません！"
      redirect_to owatters_path
    end
  end


  def show
    @favorite = current_user.favorites.find_by(owatter_id: @owatter.id)
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
    @owatter = current_user.owatters.build(owatter_params)
    render :new if @owatter.invalid?
  end

  def grave
    @owatter = Owatter.all
  end

  private

  def owatter_params
    params.require(:owatter).permit(:title, :content, :user_id)
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
