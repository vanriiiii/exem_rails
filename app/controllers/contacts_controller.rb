class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  def index
    @contact = Contact.all
  end
  
  def new
    if params[:back]
      @contact = Contact.new(contact_params)
    else
      @contact = Contact.new
    end
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path, notice:"ブログを新規作成しました"
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
    if @contact.update(contact_params)
      redirect_to contacts_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @contact.destroy
    redirect_to contacts_path notice: "ブログを削除しました！"
  end
  
  def confirm
    @contact = Contact.new(contact_params)
    render :new if @contact.invalid?
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
  
  def set_contact
    @contact = Contact.find(params[:id])
  end

  
end
