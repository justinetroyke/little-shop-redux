class LittleShopApp < Sinatra::Base

  get '/merchants' do
    @merchants = Merchant.all

    erb :'merchant/index'
  end

<<<<<<< HEAD
  get '/invoices' do
    @invoices = Invoice.all

    erb :'invoice/index'
=======
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
>>>>>>> b7ea58aae6fcf46669678d5b71e3eef210786bcd
  end
end
