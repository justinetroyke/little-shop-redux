class LittleShopApp < Sinatra::Base

  get '/' do
    erb :"homepage/index"
  end

  get '/merchants/new' do
    erb :'merchants/create'
  end

  get'/merchants/:id' do
    @merchant = Merchant.find(params['id'])

    erb :"merchants/individual_merchant"
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params['id'])
    erb :"merchants/edit"
  end

  get '/merchants/:id/delete' do
    merchant = Merchant.find(params['id'])
    Merchant.delete(merchant)
    redirect '/merchants'
  end

  post '/merchants' do
    merchant = Merchant.create(params['merchant'])

    redirect "/merchants/#{merchant.id}"
  end

  post '/merchant/:id' do
    merchant = Merchant.find(params['id'])
    merchant.update(params['merchant'])
    merchant.save
    redirect "/merchants/#{merchant.id}"
  end

  get '/merchants' do
    @merchants = Merchant.all

    erb :"merchants/index"
  end

  get '/invoices' do
    @invoices = Invoice.all

    erb :'invoice/index'
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
