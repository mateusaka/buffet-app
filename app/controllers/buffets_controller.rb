class BuffetsController < ApplicationController
  before_action :authenticate_buffet_owner!

  def new
    if current_buffet_owner.buffet
      return redirect_to root_path
    end

    @buffet = Buffet.new
  end

  def create
    if current_buffet_owner.buffet
      return redirect_to root_path
    end

    @buffet = Buffet.new(params.require(:buffet).permit(
      :brand_name,
      :corporate_name,
      :cnpj,
      :phone,
      :email,
      :address,
      :district,
      :state,
      :city,
      :cep,
      :description,
      :payment_method
    ))
    @buffet.buffet_owner = current_buffet_owner

    if @buffet.save
      redirect_to @buffet, notice: 'Buffet cadastrado com sucesso'
    else
      flash.now[:notice] = 'Erro ao cadastrar buffet'
      render 'new'
    end
  end

  def show
    @buffet = Buffet.find(params[:id])
  end

  def edit
    @buffet = Buffet.find(params[:id])
  end

  def update
    @buffet = Buffet.find(params[:id])

    if @buffet.update(params.require(:buffet).permit(
      :brand_name,
      :corporate_name,
      :cnpj,
      :phone,
      :email,
      :address,
      :district,
      :state,
      :city,
      :cep,
      :description,
      :payment_method
    ))
      redirect_to buffet_path(@buffet), notice: 'Buffet atualizado com sucesso'
    else
      flash.now[:notice] = 'Erro ao atualizar buffet'
      render 'new'
    end
  end
end
