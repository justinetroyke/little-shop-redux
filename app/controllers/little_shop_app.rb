class LittleShopApp < Sinatra::Base

  get '/merchants' do
    @merchants = Merchant.all

    erb :"merchant/index"
  end

  get '/items' do
    @items = Item.all

    erb :"item/index"
  end
end
