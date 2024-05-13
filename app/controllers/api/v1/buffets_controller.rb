class Api::V1::BuffetsController < Api::V1::ApiController
  def index
    buffets = Buffet.all

    render status: 200, json: buffets
  end

  def search
    buffet = Buffet.where(brand_name: params[:name])

    render status: 200, json: buffet
  end

  def show
    buffet = Buffet.find(params[:id])

    render status: 200, json: buffet.attributes.except('corporate_name', 'cnpj')
  end
end
