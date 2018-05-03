class LittleShopApp < Sinatra::Base

  get '/merchants' do
    @merchants = Merchant.all

    erb :"merchant/index"
  end

  get '/items' do
    @items = Item.all

    erb :"item/index"
  end

  get '/create-an-item' do
    erb :"item/create_an_item"
  end

  post '/create-an-item' do
    Item.create(params[:item])

    redirect '/'
  end
end
