class LittleShopApp < Sinatra::Base

  get '/' do
    erb :"homepage/index"
  end

  get '/merchants' do
    @merchants = Merchant.all

    erb :"merchants/index"
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

  post '/merchants' do
    merchant = Merchant.create(params['merchant'])

    redirect "/merchants/#{merchant.id}"
  end
end
